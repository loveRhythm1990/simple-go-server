# simple-go-server

This is a simple go http server app.

you can modify its code for your testing purpose, and build a docker image for it.
```shell
docker build . -t docker.io/test/go-server:v1
```

then deploy it to a K8s cluster:
```shell
kubectl create -f deployment.yaml
```

If you want to access this go http server, you can use port-forward, the port 8000 is hardcode:
```shell
kubectl port-forward pod/<you-pod-name> 8000:8000
```

access it like:
```shell
lr90@sj ~ % curl http://127.0.0.1:8000/
hello world%
```