# Assignment 3


1. Build the images for Microservices (remember to edit code for frontend) and push images to Dockerhub and write commands to run backedn & frontend and they should run fine

Solution:

Pushed images for BE/FE to dockerhub here:
https://hub.docker.com/repository/docker/sumayya2100/elementum

Images tags:
-Backend:BE-V1.0
-Frontend: V1.0 

---------------------------------------------------------------------

2. How to leverage cache using Dockerfiles

Solution:

When building an image, docker first looks for an existing image in its cache, if it is present, it re-uses it instead of creating a new one. 
→ the next step is where docker checks the instruction against all child images that are derived from the same base image
→ For ADD and COPY instructions, the checksum is compared against the checksum of existing images during cache lookup
→ these processes save the image build time considerable and are considered best practices for building images.

--------------------------------------------------------------------

3. What are multi-stage builds

Solution:

Multi-stage builds are used to optimize dockerfiles, by minimizing the size of the image, as well as reducing the build time. 
Multiple FROM statements are used to build the image, and each set of instructions beginning from the FROM statement is defined as one stage of the build. This allows for installing certain packages in one stage, and then in the next stage, only the build artifact is carried forward, which enables smaller sized image creation.


4. Explain containers vs Image

Solution:

Containers are created on the basis of the instructions contained in an image. When a container is created, a R/W layer becomes available where you can run commands to make any desired changes to the container, thereby customizing that particular container after it has been made based on the original image. Multiple containers can be made from the same image, and each of these multiple instances run in isolation from others.

Images are a packaged form of an application, and contain instructions to build containers. 


5. Explain RUN vs CMD vs Entrypoint

Solution:

RUN – it executes commands mentioned, and is a “Build time” command, i.e. the RUN commands are executed while the image is being built. 

CMD – it specifies what component is to be run by the image, and it is a “Run time” command, i.e. these commands run while running the container.
ENTRYPOINT – it is the main executable of an image. Anything that is specified in CMD, is passed on to Entrypoint as a parameter.


6. Improve the Dockerfile for python Application given in slides using the Dockerfile & then improve it and share image size & estimated build time for it

Solution:

Both images pushed to DockerHub:
Repository Link: https://hub.docker.com/repository/docker/sumayya2100/elementum



7. Run mysql container using the official image, by persisting data and passing environment variables to set username & password… You can see the information of how to persist and information here: https://hub.docker.com/_/mysql

Solution:

Ran following commands to run mysql container, and used data persistence by Volume:

1. $ docker run --name ss-mysql -e MYSQL_ROOT_PASSWORD=Business12# -d mysql:latest
2. $ docker network create ss-network
3. docker run -it --network ss-network --rm mysql mysql -hss-mysql -uexample-user -p
4. $ docker volume create mysql
5. docker container run --rm -it --net ss-network --name mysql-vol -e MYSQL_ROOT_PASSWORD=Business12# -e MYSQL_USER=sumayya -v mysql:/home/osboxes/Desktop/git-home/persist mysql:latest