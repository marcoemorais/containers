# containers

Dockerfiles used as base images for my personal projects.

## How To Run

Build base image from `DIR`.  To disambiguate my local base images from potentially similarly named images available from public upstream repos, I tag local images with the name `local`.
```
$ make -C [DIR] docker-build
```

Run a base image built from `DIR`.  This will start the container and put you into a local shell.
```
$ make -C [DIR] docker-run
```

Shell into an already running container built from `DIR`.
```
$ make -C [DIR] docker-exec
```

