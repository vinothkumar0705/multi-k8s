docker build -t vinothkumar1selvaraj/multi-client -f ./client/Dockerfile ./client
docker build -t vinothkumar1selvaraj/multi-server -f ./server/Dockerfile ./server
docker build -t vinothkumar1selvaraj/multi-worker -f ./worker/Dockerfile ./worker
docker push vinothkumar1selvaraj/multi-client
docker pust vinothkumar1selvaraj/multi-server
docker push vinothkumar1selvaraj/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=vinothkumar1selvaraj/multi-server
