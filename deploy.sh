docker build -t chadnankumar01/multi-client:latest -t chandankumar01/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t chadankumar01/multi-server:latest -t chandankumar01/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t chandankumar01/multi-worker:latest -t chandankumar01/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push chandankumar01/multi-client
docker push chandankumar01/multi-server
docker push chandankumar01/multi-worker


kubectl apply -f k8s
kubectl set image deployments/server-deployment server=chandankumar01/multi-server
