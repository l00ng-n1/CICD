REGISTRY=harbor.loong.com
PORT=8888

HOSTS="
 10.0.0.205
 10.0.0.206
 "

mvn clean package -Dmaven.test.skip=true
docker build -t ${REGISTRY}/private/myapp:v$BUILD_ID .
docker push ${REGISTRY}/private/myapp:v$BUILD_ID
for i in $HOSTS; do
    docker -H $i rm -f myapp
    docker -H $i run -d -p ${PORT}:8888 --restart always --name myapp ${REGISTRY}/private/myapp:v$BUILD_ID
    #ssh root@$i "docker rm -f myapp ; docker  run -d  -p 8888:8888 --name myapp --restart always ${REGISTRY}/example/myapp:v$BUILD_ID"
    #ssh root@$i docker run  -d  -p ${PORT}:8888 --restart always --name myapp${REGISTRY}/example/myapp:v$BUILD_ID
done
