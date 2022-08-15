## Docker

1. Build:

``
docker build . -t webgateway
``

2. Tag: 

``
docker tag webgateway:latest crsharedhappeningfactory.azurecr.io/services/webgateway:latest
``

3. Push:

``
docker push crsharedhappeningfactory.azurecr.io/services/webgateway:latest
``

## Run the contianer

docker run -it -i -p 5000:80 -p 7001:443 webgateway:latest