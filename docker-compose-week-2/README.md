# Docker Compose Week 2

The repository is based on DataStax Devs Docker Learning Path. (https://github.com/datastaxdevs/docker-learning-path/tree/master/week-2)

The main purpose is to:
1) Create environment with Docker Compose script so that more than the application that depends on multiple services is spinned up in multiple docker containers which communicate with each other.
2) For that I will use my hobby project that is otherwise deployed in AWS environment and accessible on [ITShelf.com](http://itshelf.com).

## Application

### Springboot Java Application

First dockerized component is Springboot Java Application that renders content with the Thymeleaf template engine.
It's a content management service that offers list of online IT courses and events.
The service is completely stateless. To be able to present event information it needs underlaying database.

### Postgres Database

Postgres database containing basic information about IT events.
Data is initialized for the first time the DB container is run. 
Tables are generated based on the init.sql and dummy data is loaded with SQL INSERT statements. 
Specific volume is mounted to the image which is serving as data persistence. 
Everytime the this container is recreated the volume will be mounted which contains DB data so it does not needs to be initialized anymore.

## Docker Compose

Dockerized web application, database, networking, volumes are defined in Docker Compose file. The content of the script with commented steps can be found in
[docker-compose.yaml](docker-compose.yaml).