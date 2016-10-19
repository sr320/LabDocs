### Dockerfiles

##### All Dockerfiles are text files. See each one for a list of software that they will install.

#### Dockerfile.bio - 
A Dockerfile intended to create a container containing the full suite of bioinformatics software most frequently used by the Roberts Lab. Highlights include RStudio and Jupyter Notebooks. The current image built from this Docker file is ~8GB. 

##### Quick Start Instructions (see the [detailed instructions here](https://github.com/sr320/LabDocs/blob/master/code/docker.md)). To use this Dockerfile, first install and run [Docker](https://www.docker.com/). Then...
1. Download the Dockerfile (cloning this repo is ideal) to its own directory.
1. Open a terminal.
2. Change to the directory containing the Dockerfile.
3. Build the Docker image: 
  
  ```docker build --tag="bioinformatics:v11" --file="Dockerfile.bio" .```
4. Run the Docker image to create a Docker container:

  ```docker run -p 8888:8888 -p 8787:8787 -it bioinformatics:v11 /bin/bash```

5. You are now in the Docker container! Feel free to poke around - you can't break anything!
6. When finished, exit the container: ```exit```

NOTES: 

1. Mac users will likely need to enter the following command after Step 2: ```eval "$(docker-machine env default)"```


