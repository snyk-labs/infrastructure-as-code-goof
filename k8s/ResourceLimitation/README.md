# Resource limitation (memory)

## Context
Limiting the Memory available to the container has operational as well as security benefits. In the context of security this is about limiting the impact of potential denial of service attacks to affecting the app rather than the node and potentially the whole cluster.

## Env components
We have 2 different apps - both run on the same node (with different pods).
**That basically means that the 2 apps share the same resources.**

### App 1 - Vulnerable app
This is an example for an app without any resourse limitation as part of the [deployment config](k8s/ResourceLimitation/app1/deployment.yaml).

The app exposes 3 APIs:
1. `/app1/mem` - display the total and available memory on the pod
2. `/app1/allocate?MBs=10&Secs=10` - allocates specific amount of memory on the backend side (10 MBs for 10 secs in this case) 
3. `/app1/stress` - tries to allocate all of the free memory on the pod

Those APIs demo logic that can lead into performance issues on the backend side (memory issues in our case).

Malicious users can use them and drain the memory resources from the pod. Another example is DDOS attack that can use the same logic to allocate resources of apps, and block other users from accessing those apps.

**Without any resource limitations of the pod, the malicious users can also effect the performance of other pods that run on the same node.**


<img src="pics/app1.png?raw=true" width="400">

### App 2 - Innocent app
This app exposes only the `/app1/mem` API - so you can check the affect of App 1 on it.

<img src="pics/app2.png?raw=true" width="400">


## Exploit
1. Go to your Kubernetes dashboard and look for the IP of the application
    * Go to `Discovery and Load Balancing -> Ingresses`
    * Take the IP of `resource-limitation-pod-ingress`
2. Open 2 different tabs:
    * http://IP/app1
    * http://IP/app2
3. Start monitoring the status of App 2 by refrashing the page http://IP/app2/mem
4. Start allocating memory on App 1 by surfing http://IP/app1/allocate?MBs=200&Secs=10
    * This will allocate 100 MBs for 10 secs
5. Look for the memory status of App 2 - the amount of available memory should decrease in ~100 MBs
6. Keep playing with that setup :) you can also use http://IP/app1/stress

## Fix
In order to fix that issue, one should add resourse limitation for the pod:
1. Clean your environment by running the [cleaning script](k8s/ResourceLimitation/cleanup.sh)
2. Change the [deployment config](k8s/ResourceLimitation/app1/deployment.yaml) and uncomment the resources block:
```
resources:
    limits:
        memory: 50Mi
    requests:
        memory: 50Mi
```
3. Setup your environment again by running the [building script](k8s/ResourceLimitation/build.sh)
4. Return on the exploit steps from above. You can see that this time when you try to allocate memory on App 1 (http://IP/app1/allocate?MBs=200&Secs=10), the allocation fails with `Failed to allocate 200MB`.
5. Pay attention that you can still allocate small amount of memory like - http://IP/app1/allocate?MBs=2&Secs=10