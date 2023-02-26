# Argo CD Helmfile plugin

This plugin allows [Argo CD](https://github.com/argoproj/argo-cd) to manage applications defined using [Helmfile](https://github.com/helmfile/helmfile).

## Installation

Patch your Argo CD Helm values with following:

```yaml
repoServer:
  extraContainers:
    - name: plugin-helmfile
      image: ghcr.io/zerodayyy/argocd-plugin-helmfile:v1.0.0
      command: ["/var/run/argocd/argocd-cmp-server"]
      securityContext:
        runAsNonRoot: true
        runAsUser: 999
      volumeMounts:
        - mountPath: /var/run/argocd
          name: var-files
        - mountPath: /home/argocd/cmp-server/plugins
          name: plugins
```

Now, all Argo CD Applications containing `helmfile.yaml` file will be processed using Helmfile.
