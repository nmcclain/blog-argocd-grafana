
all:
	helm upgrade --install --create-namespace -n blog argocd ./helm

secret:
	kubectl create secret -n blog generic grafana \
		--from-literal=user=admin \
		--from-literal=password='blog-demo-INSECURE'

uninstall:
	helm uninstall -n blog argocd

argocd-admin-pw:
	kubectl get secret -n blog argocd-initial-admin-secret -o json | jq -r .data.password | base64 -d

portforward:
	kubectl port-forward svc/argocd-server -n blog 8443:443 &
	kubectl port-forward svc/argocd-grafana -n blog 3000:80 &
