### Roberts Lab Docker Help File

Build the Docker Image

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

Start a Docker Container (Basic)

These instructions will run a Docker container with no "frills."

- Requires that a Docker image has already been built
- Mac users: If opening a new Terminal window, enter the following before proceeding:

```eval "$(docker-machine env default)"```

1. Identify existing image(s):

  ```docker ps -a```
  
2. Start a Docker container (replace IMAGE with desired image name from Step 1): 

  ```docker run -it IMAGE /bin/bash```
