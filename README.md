# shell-console

## Kubernes deployment
Use this snippet to deploy a interactive shell in your kubernetes cluster

```yaml
---
apiVersion: v1
kind: Pod
metadata:
  name: shell-interactive
  labels:
    app: shell-interactive
spec:
  containers:
  - name: shell-interactive
    image: attiliogreco96/friendly-shell
    command: ["/bin/sleep", "3650d"]
    imagePullPolicy: IfNotPresent
  restartPolicy: Always
```

## Get a shell

```bash
kubectl exec -it shell-interactive /bin/fish
```