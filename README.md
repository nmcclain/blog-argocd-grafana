
# This Helm chart contains examples for this blog post: URL TK TODO

See `helm/values.yaml` for configuration options.

1. `cd helm`
2. `helm dependencies update`
3. Edit values.yaml
  1. At a minimum, you'll need to manually set the `secureJsonData.bearerToken` at the bottom of `helm/templates/grafana-datasource-argocd.yaml`. You can create this JWT in ArgoCD->project->role.
4. `cd ..`
5. Create a secret for your grafana admin user:
```
        kubectl create secret -n blog generic grafana \
                --from-literal=user=admin \
                --from-literal=password='blog-demo-INSECURE'
```
6. Install the chart: `helm upgrade --install --create-namespace -n blog argocd ./helm`
7. See the `Makefile` for commands to setup port forwarding and get the ArgoCD admin password.
