param($POD,$DUMPDST,$INITDST,$SHDST)

$POD=$(kubectl get pod -l app=fa-postgres-rev -o jsonpath="{.items[0].metadata.name}")

$INITDST=$($POD + ":initdb.sql")

$DUMPDST=$($POD + ":location.sql")

$SHDST=$($POD + ":initdb.sh")

Write-Host "Copying files to postgres deployment pod: $POD..."

kubectl cp initdb.sql $INITDST
kubectl cp location.sql $DUMPDST
kubectl cp initdb.sh $SHDST

Write-Host "Success!"

Write-Host "Restoring database in: $POD..."

kubectl exec $POD -i -t -- chmod g+w,o-rw,a+x initdb.sh

kubectl exec $POD -i -t -- sh initdb.sh

Write-Host "Success!"

Write-Host "Deleting setup files from: $POD..."

kubectl exec $POD -i -t -- rm initdb.sql
kubectl exec $POD -i -t -- rm location.sql
kubectl exec $POD -i -t -- rm initdb.sh

Write-Host "Success!"