# Cloud Config Goof
A full demo environment to educate about the challenges and potential security issues in the cloud config world. 

# Issues

<img src="https://github.com/kubernetes/kubernetes/raw/master/logo/logo.png" width="100">

## Kubernetes
* [Privileged pod](k8s/PrivilegedPod/README.md) - what is the problem of having a [privileged pod](https://kubernetes.io/docs/concepts/policy/pod-security-policy/#privileged) on your cluster
* [Resource limitation](k8s/ResourceLimitation/README.md) - what are the potential problems in case there are no [resource limitations](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/#resource-requests-and-limits-of-pod-and-container) on your containers


# General Setup
1. Install and run [minikube](https://kubernetes.io/docs/setup/learning-environment/minikube/#installation).
2. Run minikube - `minikube start`
    * If you already have a running minikube, and you want to start with clean environment - `minikube delete`
3. Run `minikube dashboard` and make sure you have a working (hopefully empty) Kubernetes cluster
4. Run `./build.sh` (from the main dir of every issue example)
    * The `build.sh` applys all of the required config for each and every example
5. Look for the new components on your cluster (Pod / Deployment / Service / Ingress)
6. Continue with the instructions of each one of the examples for more specific details
5. When you're done - you can run `./cleanup.sh` (from the main dir of every issue example) in order to revert all of the changes done by the `build.sh` script