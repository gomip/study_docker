1. Explore the current setup and identify the number of networks that exist on this system.   
```docker network ls```
2. What is the ID associated with the bridge network?   
   ```docker network ls```
3. We just ran a container named alpine-1. Identify the network it is attached to.   
```docker inspect alpine-1```
4. What is the subnet configured on bridge network?   
```docker network inspect bridge```
5. Run a container named alpine-2 using the alpine image and attach it to the none network.   
```docker run --name alpine-2 --network none alpine```
6. Create a new network named wp-mysql-network using the bridge driver. Allocate subnet 182.18.0.1/24. Configure Gateway 182.18.0.1   
```docker network create -d bridge --subnet 182.18.0.1/24 --gateway 182.18.0.1 wp-mysql-network```
7. Deploy a mysql database using the mysql:5.6 image and name it mysql-db. Attach it to the newly created network wp-mysql-network
Set the database password to use db_pass123. The environment variable to set is MYSQL_ROOT_PASSWORD.   
``` docker run -d --name mysql-db --network wp-mysql-network -e MYSQL_ROOT_PASSWORD=db_pass123 mysql:5.6```
8. Deploy a web application named webapp using the kodekloud/simple-webapp-mysql image. Expose the port to 38080 on the host.   
The application makes use of two environment variable:
1: DB_Host with the value mysql-db.
2: DB_Password with the value db_pass123.
Make sure to attach it to the newly created network called wp-mysql-network.   
Also make sure to link the MySQL and the webapp container.   
```
docker run -d --name webapp -p 38080:8080 -e DB_Host=mysql-db -e DB_Password=db_pass123 --network wp-mysql-network --link mysql-db:mysql-db --link webapp kodekloud/simple-webapp-mysql
```
