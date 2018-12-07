# kubectl create secret generic db-user-pass --from-file=./username.txt --from-file=./password.txt
kubectl create secret generic mysql-pass --from-literal=password=LINUXCALI2018
kubectl get secret

kubectl create -f ghost_local-volumes.yaml
kubectl get pv

# Habilita las métricas para auto escalar el servicio
minikube addons enable metrics-server  

kubectl apply -f ghost-mysql-deployment.yaml
kubectl apply -f ghost-app-deployment.yaml
  
kubectl autoscale deployment ghost --cpu-percent=50 --min=1 --max=5

minikube service ghost --url

# Cantidad de nodos auto escalados
kubectl get hpa

# In the other terminal

kubectl run -i --tty load-generator --image=busybox /bin/sh
 
while true; do wget -q -O- http://192.168.99.100:32094 ; done