docker pull tomcat:latest

docker run -d --name mytomcat -p 8080:8080 tomcat:latest

docker exec -it mytomcat /bin/bash

mv webapps webapps2

mv webapps.dist/ webapps

exit