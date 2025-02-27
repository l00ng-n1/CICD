APP=helloworld-spring-boot
HARBOR=harbor.loong.com

HOST_LIST="
 10.0.0.205
 10.0.0.206
"
PORT=8888

for host in $HOST_LIST; do
    #ssh root@$host "docker rm -f $APP ; docker run -d --name $APP -p 80:$PORT $HARBOR/private/$APP:$TAG"
    #docker -H $host rm -f $APP
    #docker -H $host run -d --restart=always --name $APP -p 80:$PORT $HARBOR/private/$APP:$TAG
    docker -H ssh://root@$host rm -f $APP
    docker -H ssh://root@$host run -d --restart=always --name $APP -p 80:$PORT $HARBOR/private/$APP:$TAG
done
