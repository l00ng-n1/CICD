APP=hello-world-war
APP_PATH=/var/lib/tomcat10/webapps

HOST_LIST="
 10.0.0.205
 10.0.0.206
 "
mvn clean package -Dmaven.test.skip=true
for host in $HOST_LIST; do
    ssh root@$host systemctl stop tomcat10
    scp target/${APP}-*.war root@$host:${APP_PATH}/hello.war
    ssh root@$host systemctl start tomcat10
done
