# Privileged Pod

## Creating the Redis Deployment

1. Launch a terminal window in the directory you downloaded the manifest files.
2. Apply the Redis Deployment from the `setup/redis-deployment.yaml` file:
    ```
    kubectl apply -f setup/redis-deployment.yaml
    ```
3. Query the list of Pods to verify that the Redis Pod is running:
    ```
    kubectl get pods
    ```
4. The response should be similar to this:
    ```
    NAME                            READY     STATUS    RESTARTS   AGE
    redis-0689899894-4asdf   1/1       Running   0          16s
    ```

## Creating the Redis Service

1. Apply the Redis Service from the following `setup/redis-service.yaml` file:
    ```
    kubectl apply -f setup/redis-service.yaml
    ```
2. Query the list of Services to verify that the Redis Service is running:
    ```
    kubectl get service
    ```
3. The response should be similar to this:
    ```
    NAME           TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)    AGE
    kubernetes     ClusterIP   10.0.0.1     <none>        443/TCP    1m
    redis          ClusterIP   10.0.0.160   <none>        6379/TCP   16s
    ```
