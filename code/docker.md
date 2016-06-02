### Roberts Lab Docker Help File

This file is intended to provide a brief introduction on using Docker and the Dockerfile, [Dockerfile.bio](https://github.com/sr320/LabDocs/blob/master/code/dockerfiles/Dockerfile.bio), for the Roberts Lab.

There are four sections of instructions, each with increasing usage complexity:

- [Build an Image](#build): Required to begin working with Docker.
- [Starting a Container](#basic): Instructions on running a container from an image. Lacks the ability to interact with files on your computer.
- [Using R Studio & Jupyter Notebooks](#intermediate): Instructions on how to run a container and use R Studio and Jupyter Notebooks in your computer's browser. Lacks the ability to interact with files on your computer.
- [Interact with Files on Your Computer](#advanced): Instructions on how to run a container that can interact with files on your computer. This will be the most useful container and will likely be the default setup you use from here on out.

#### <a name="build"></a> Build the Docker Image

- Only needs to be done once.
- Items in all caps (e.g. NAME) can be replaced with text of your choosing and does not need to be uppercase.
- ~3GB in size

1. Download and install [Docker](https://www.docker.com/) for your operating system.
2. Download the Roberts Lab bioinformatics Dockerfile: [Dockerfile.bio](https://github.com/sr320/LabDocs/blob/master/code/dockerfiles/Dockerfile.bio)
3. Change to the directory where you saved the Dockerfile.
4. Open a terminal.
5. Build the Docker image:
  1. On Mac: 
    1. ```eval "$(docker-machine env default)"```
    2. ```docker build --tag="NAME/bioinformatics:v11" --file="Dockerfile.bio" .```
  2. Non-Mac:```docker build --tag="NAME/bioinformatics:v11" --file="Dockerfile.bio" .```

Explanation:
- ```docker build``` constructs the Docker image from the instructions in the Dockerfile. The Dockerfile tells Docker which programs should be downloaded, installed, and where/how to install them in the Docker image.
- ```--tag="<name>"``` Allows you to give the image you build an easy to remember name. It can be anything you like.
- ```--file="<dockerfile_name>" .``` Tells Docker the name of the Dockerfile and to look for it in the current directory (the ```.```).

#### <a name="basic"></a> Start a Docker Container (Basic)

These instructions will run the Docker container from the image built above with no "frills." See the [Intermediate](#intermediate) instructions to begin using R Studio and Jupyter Notebooks in the Docker container.

- Requires that a Docker image has already been built
- Mac users: If opening a new Terminal window, enter the following before proceeding:

```eval "$(docker-machine env default)"```

1. Identify existing image(s):

  ```docker ps -a```
  
2. Start a Docker container (replace IMAGE with desired image name from Step 1): 

  ```docker run -it IMAGE /bin/bash```

  You will now be inside the docker container. The container is basically a specialized computer that has very few programs besides the bioinformatics programs specified in the Dockerfile. Feel free to move around and try things out.

3. Exit the container: Type "exit".


Explanation:

- ```docker ps -a``` Lists all images on the system in order they were created, newest to oldest
- ```docker run``` Starts a Docker container. Requires an image name.
- ```-it``` Starts a Docker container with an interactive terminal (i.e. a terminal window to type in).
- ```IMAGE``` The name of the image that should be used to start the Docker container.
- ```/bin/bash``` The command that the container should run when it starts. In this case, we tell the container to start bash. Bash is the command line stuff you use when using Terminal.

#### <a name="intermediate"></a> Run R Studio and Jupyter Notebook in Docker Container (Intermediate)

1. Start a Docker container with specific port mappings:

  ```docker run -p 8787:8787 -p 8888:8888 -it IMAGE /bin/bash```

2. Start R Studio (enter this inside the container):

  ```rstudio-server start```
  
3. Start Jupyter Notebook (enter this inside the container):

  ```jupyter notebook```

4. Run R Studio in your browser:
  1. Enter URL:
    1. Mac users: ```192.168.99.100:8787```
    2. Others: ```localhost:8787```
  2. Enter the following credentials in the R Studio interface:
    1. Username: srlab
    2. Password: rstudio

5. Run Jupyter Notebook in your browser:
  1. Enter URL (in a different window or tab than what you're using for R Studio):
    1. Mac users: ```192.168.99.100:8888```
    2. Others: ```localhost:8888```

#### <a name="advanced"></a> Access Files Outside of a Docker Container (Advanced)
