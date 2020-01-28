# Resource limitation (memory)

## Context
Limiting the Memory available to the container has operational as well as security benefits. In the context of security this is about limiting the impact of potential denial of service attacks to affecting the app rather than the node and potentially the whole cluster.

## Setup
    1. Install and run [minikube](https://kubernetes.io/docs/setup/learning-environment/minikube/#installation).
    2. Cleanup environment if needed: `minikube delete`.
    3. `./build.sh`
    4. `minikube dashboard` to get ingress IP address (`192.168.99.100` in my case). 

## Env components
### App 1 / 2

## Problem
