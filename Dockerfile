# Reference for Docker image commands https://docs.docker.com/engine/reference/builder/

# The FROM instruction initializes a new build stage and sets the Base Image for subsequent instructions.
# This image is form https://hub.docker.com/_/python
# Dockerfile https://github.com/docker-library/python/blob/65492057bd7e8d238e494ded1c478023036864db/3.8/alpine3.12/Dockerfile
FROM python:3-alpine

# The WORKDIR instruction sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile
WORKDIR /usr/scr/app

# Copy content of current directory in host to WORKDIR in the image (Should include python application)
# The COPY instruction copies new files or directories from <src> and adds them to the filesystem of the container at the path <dest>.
COPY app.py .

# The RUN instruction will execute any commands in a new layer on top of the current image and commit the results. 
# The resulting committed image will be used for the next step in the Dockerfile.
RUN pip install flask==1.1.2

# ENTRYPOINT vs CMD
# ENTRYPOINT -> https://docs.docker.com/engine/reference/builder/#entrypoint
# CMD -> https://docs.docker.com/engine/reference/builder/#cmd
# I am using entry point for the command and parameters as its not meant to change any of them. Whole container is one executable for the user.
ENTRYPOINT ["flask", "run", "--host=0.0.0.0", "--port=80"]