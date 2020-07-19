docker build -t vinothkumar1selvaraj/multi-client:latest -t vinothkumar1selvaraj/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t vinothkumar1selvaraj/multi-server:latest -t vinothkumar1selvaraj/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t vinothkumar1selvaraj/multi-worker:latest -t vinothkumar1selvaraj/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push vinothkumar1selvaraj/multi-client:latest
docker pust vinothkumar1selvaraj/multi-server:latest
docker push vinothkumar1selvaraj/multi-worker:latest

docker push vinothkumar1selvaraj/multi-client:$SHA
docker pust vinothkumar1selvaraj/multi-server:$SHA
docker push vinothkumar1selvaraj/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=vinothkumar1selvaraj/multi-server:$SHA
kubectl set image deployments/client-deployment client=vinothkumar1selvaraj/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=vinothkumar1selvaraj/multi-worker:$SHA
