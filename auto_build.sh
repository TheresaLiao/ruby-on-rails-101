CONTAINER_NAME=ruby-ui
IMAGE_NAME=ruby-ui:v1.0.0

HOST_PATH=${pwd}/tmp/db
CONTAINER_PATH=/var/lib/postgresql/data

docker rm -f $CONTAINER_NAME
docker build -t $IMAGE_NAME .
docker run -ti -d \
	-p 3000:3000 \
	--name=$CONTAINER_NAME \
	-v $HOST_PATH:$CONTAINER_PATH \
	$IMAGE_NAME \
	bash

	#bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'"
