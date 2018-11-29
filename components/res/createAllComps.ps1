echo "Creating kube deployments/pods and all dependencies..."
# kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
kubectl create -f ./config-maps/postgres-config.yaml
kubectl create -f ./persistent-volumes/postgres-pv.yaml
kubectl create -f ./persistent-volume-claims/postgres-pv-claim.yaml
kubectl create -f ./deployments/postgres-deployment.yaml
echo "Success!"