# Infrastructure as Code Goof
This repo consists of vulnerable configuration files, split per configuration type. 
The files contain various vulnerabilities which Snyk Infrastructure as Code can identify, as well as scripts for setting up demo environments to educate about the challenges and potential security issues in the Infrastructure as Code world.

## Features
### CloudFormation
The `./cloudformation` directory contains various vulnerable CloudFormation templates which can be scanned by Snyk

### Kubernetes
The `./k8s` directory contains demo-able applications which emphasise why different settings in your configurations files can expose you to security attacks:
* [Privileged pod](k8s/PrivilegedPod/README.md) - the problem with having a [privileged pod](https://kubernetes.io/docs/concepts/policy/pod-security-policy/#privileged) on your cluster
* [Resource limitation](k8s/ResourceLimitation/README.md) -the potential problems in case there are no [resource limitations](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/#resource-requests-and-limits-of-pod-and-container) on your containers
* [RBAC misconfiguration](k8s/RBAC-Misconfiguration/README.md) - the vulnerabilities one exposes the cluster to by misconfiguring [RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)

To start the demos, you need to follow these steps:
1. Install and run [minikube](https://kubernetes.io/docs/setup/learning-environment/minikube/#installation).
2. Run minikube - `minikube start`
    * If you already have a running minikube, and you want to start with clean environment - `minikube delete`
3. Run `minikube dashboard` and make sure you have a working (hopefully empty) Kubernetes cluster
4. Run `./build.sh` (from the main dir of every issue example)
    * The `build.sh` applies all of the required config for each and every example
5. Look for the new components on your cluster (Pod / Deployment / Service / Ingress)
6. Continue with the instructions of each one of the examples for more specific details
7. When you're done - you can run `./cleanup.sh` (from the main dir of every issue example) in order to revert all of the changes done by the `build.sh` script


This directory also contains various other vulnerable Kubernetes templates under `./k8s/templates`, which can also be scanned by Snyk.

### Terraform
The `./terraform` directory contains various vulnerable Terraform files.

## Testing for vulnerabilities
To scan any of the files and directories in this repo with Snyk, install [snyk](https://github.com/snyk/snyk/) `snyk iac test` either from the main directory or by pointing at each file one by one.

For example:
- to test a single file:
```
$ snyk iac test cloudformation/templates/aurora.yaml
```
- to test a folder:
```
$ snyk iac test k8s/
```
- to test a nested folder:
```
$ snyk iac test terraform/aws/
```
