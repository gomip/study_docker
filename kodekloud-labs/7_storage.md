1. What location are the files related to the docker containers and images stored?   
```/var/lib/docker```
2. What directory under /var/lib/docker are the files related to the container alpine-3 image stored?   
```starts with container id ```
3. Run a mysql container named mysql-db using the mysql image. Set database password to db_pass123   
```docker run --name mysql-db -e MYSQL_ROOT_PASSWORD=db_pass123 mysql```
4. We have just written some data into the database. To view the information we wrote, run the get-data.sh script available in the /root directory. How many customers data have been written to the database?   
```30```
5. Run a mysql container again, but this time map a volume to the container so that the data stored by the container is stored at /opt/data on the host.
Use the same name : mysql-db and same password: db_pass123 as before. Mysql stores data at /var/lib/mysql inside the container.
```
docker run --name mysql-db -e MYSQL_ROOT_PASSWORD=db_pass123 -v /opt/data:/var/lib/mysql mysql
```
6. Disaster strikes.. again! And the database crashed again. But this time we have the data stored at /opt/data directory. Re-deploy a new mysql instance using the same options as before.
Just run the same command as before. Here it is for your convenience:
```docker run -v /opt/data:/var/lib/mysql -d --name mysql-db -e MYSQL_ROOT_PASSWORD=db_pass123 mysql```