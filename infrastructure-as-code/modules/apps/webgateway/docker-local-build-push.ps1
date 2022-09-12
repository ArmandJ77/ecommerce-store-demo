cd ..\..\..\..\web-gateway

docker build -t webgateway .

docker tag webgateway:latest crsharedhappeningfactory.azurecr.io/webgateway:latest
docker push crsharedhappeningfactory.azurecr.io/webgateway:latest