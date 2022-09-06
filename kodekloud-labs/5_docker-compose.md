1. First create a redis database container called redis, image redis:alpine.   
```
docker run --name redis -d redis:alpine
```
2. Next, create a simple container called clickcounter with the image kodekloud/click-counter, link it to the redis container that we created in the previous task and then expose it on the host port 8085   
The clickcounter app run on port 5000.   
```
docker run --name clickcounter --link redis:redis -p 8085:5000 kodekloud/click-counter
```
3. Let's clean up the actions carried out in previous steps. Delete the redis and the clickcounter containers.   
```
docker ps 
docker stop 
docker rm
```
4. Create a docker-compose.yml file under the directory /root/clickcounter. Once done, run docker-compose up.   
The compose file should have the exact specification as follows -   
redis service specification - Image name should be redis:alpine.
clickcounter service specification - Image name should be kodekloud/click-counter, app is run on port 5000 and expose it on the host port 8085 in the compose file.
```
redis:
  image: redis:alpine
clickcounter:
  image: kodekloud/click-counter
  ports:
    - 8085:5000
  links:
    - redis
```