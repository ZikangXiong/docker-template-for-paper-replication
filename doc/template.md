# Replication Instruction

## Environment  

### Hardware environment

```sh
CPU: Intel i7-10700K
GPU: GTX 2080 Ti
Memory: 64 GB
```  

### Dependent Docker Image

```sh
ubuntu:21.04
```

## Project Structure

```sh
.
├── LICENSE
├── README.md
├── doc
│   └── template.md
└── docker                  # Docker related scripts
    ├── common.sh
    ├── config.sh           # Configurate docker image and project information here
    ├── dev_into.sh         # Developing mode, create a bash process with docker container
    ├── dev_start.sh        # Developing mode, create a docker container with docker image
    ├── dev_stop.sh         # Developing mode, stop and remove (with -f) a docker container
    └── notebook_start.sh   # If jupyter-lab installed, start the jupyter-lab and expose it to port 8080 on the host
```

## Replicating Steps

1. Clone this repository.  
2. Fill docker image information and project name in the `docker/config.sh`.  
3. Run `bash docker/dev_start.sh` to start a docker container. The path of the cloned repository and `~/data` will be mounted under the `/workspace` in the container.  

## Reusability

This template can be reused for any Docker-based replication package. One can develop from scratch with this template, and will not concern that others cannot replicate their results due to the dependencies.  
