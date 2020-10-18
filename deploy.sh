docker build -t chadnankumar01/multi-client:latest -t chandankumar01/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t chadankumar01/multi-server:latest -t chandankumar01/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t chandankumar01/multi-worker:latest -t chandankumar01/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push chandankumar01/multi-client:lstest
docker push chandankumar01/multi-server:latest
docker push chandankumar01/multi-worker:latest


docker push chandankumar01/multi-client:$SHA
docker push chandankumar01/multi-server:$SHA
docker push chandankumar01/multi-worker:$SHA


kubectl apply -f k8s
kubectl set image deployments/server-deployment server=chandankumar01/multi-server:$SHA
kubectl set image deployments/client-deployment client=chandankumar01/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=chandankumar01/multi-worker:$SHA

