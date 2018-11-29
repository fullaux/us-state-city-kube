echo "Deleting kube deployments/pods and all dependencies..."
kubectl delete -f ./deployments/postgres-deployment.yaml
kubectl delete -f ./persistent-volume-claims/postgres-pv-claim.yaml
kubectl delete -f ./persistent-volumes/postgres-pv.yaml
kubectl delete -f ./config-maps/postgres-config.yaml
# kubectl delete -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
echo "Success!"