# docker-example
Docker basics revisited

The repository is based on DataStax Devs Docker Learning Path. (https://github.com/datastaxdevs/docker-learning-path/tree/master/week-1)

## Week 1

The main purpose is to:
1) Build a Dockerfile for a simple Python3/Flask Hello World application.
2) Upload Docker image to Docker Hub repository.
3) Run and experiment with the Docker container.

### 1) Build image

The instructions of the image is in a Dockerfile. Commands are explained with comments.

**Build an image**

Build the image based on the instructions form Dockerfile.
We specify that the Docker file is in the current directory and with the -t flag we explicitly set the name of the image.

```docker build . -t rivancic/python-flask:latest```

**Run the container based on the above image**

To spin up container that is the actual instance of the image we issue docker run command with the name of the image and a tag. 
With flag -p port mapping is defined. Port 8080 on host will be mapped to port 80 in container. In port specification on the Llft is host port, on the right is port of the container.
With --name flag specific readable name is set for the container. Otherwise default name is set.

### 2) Upload image to DockerHub

Login to dockerhub with following command and provide credentials

```docker login```

Tag the image that was just build

```docker tag {image-id} rivancic/python-flask:latest```

Push image to repository

```docker push rivancic/python-flask:latest```

After the upload finishes a new image should be available in your docker image repository. Now one can download the image with docker pull command.

```docker pull rivancic/python-flask:latest```

### 3) Running image and managing container / images

**Running Starting Stopping**

Now as image was build locally one can run the image as a container

```docker run -p 8080:80 --name python-flask rivancic/python-flask:latest```

And now you can access the application with your browser navigating to localhost:8080 where the Hello World will await you.

As the image was being started in interactive mode one can exit with control + c command.

If you do not want to attach to the running container in terminal you can use flag ```-d``` to run the container in the background.

One can also start/run docker in the deamon mode (in the background process).

To stop the container use docker stop command following name or id

```docker stop python-flask```

To start stopped container use command start

```docker start python-flask```

In case you want to attach to the running container or run a specific command in it you can run exec command

```docker exec -it python-flask /bin/sh```

Command /bin/sh will run shell in alpine image. So you can use it to execute other commands.

**Inspection**

One can list all running containers with:

```docker ps```

While if you are interested also in stopped containers use -a flag to show all.

```docker ps -a```

To see images run 

```docker images```

To inspect docker logs you can use logs command. With -f flag to keep following on new logs

```docker logs -f python-flask```

**Deletion**

In case you do not need image or container anymore you can delete them with 

Deleting images ```docker rmi```

Deleting containers  ```docker rm```