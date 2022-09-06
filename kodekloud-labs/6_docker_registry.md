1. What is a Docker Registry?   
It is a storage and distribution system for named Docker images
2. By default, the Docker engine interacts with ?   
Dockerhub
3. Which command is used for Login to a self-hosted registry?   
```docker login [SERVER]```
4. Let practice deploying a registry server on our own.
   Run a registry server with name equals to my-registry using registry:2 image with host port set to 5000, and restart policy set to always.   
```
docker run --name my-registry -p 5000:5000 --restart always registry:2
```
5. push two images for now .i.e. nginx:latest and httpd:latest.   
```
docker pull nginx
docker image tag nginx:latest localhost:5000/nginx:latest
docker push nginx 

docker pull httpd
docker image tag httpd:latest localhost:5000/httpd:latest
docker push httpd
```
6. Let's remove all the dangling images we have locally. Use docker image prune -a to remove them. How many images do we have now?   
```
dockeri mage prune -a
```
7. Now we can pull images from our registry-server as well. Use docker pull [server-addr/image-name] to pull the images that we pushed earlier.   
```
docker pull localhost:5000/nginx
```
8. Let's clean up after ourselves.
   Stop and remove the my-registry container.   
```
docker ps -a
docker rm
```