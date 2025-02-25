APP=spring-boot-helloworld
APP_PATH=/data/${APP}
HOST_LIST="
 10.0.0.202
 10.0.0.203
 "
PORT=8888
mvn clean package -Dmaven.test.skip=true
for host in $HOST_LIST; do
    ssh root@$host "[ -e $APP_PATH ] || mkdir -p $APP_PATH"
    ssh root@$host killall -9 java &>/dev/null
    scp target/${APP}-*-SNAPSHOT.jar root@$host:${APP_PATH}/${APP}.jar
    #ssh root@$host "java -jar ${APP_PATH}/${APP}.jar --server.port=8888 &"
    ssh root@$host "nohup java -jar  ${APP_PATH}/${APP}.jar --server.port=$PORT &>/dev/null & " &
done
