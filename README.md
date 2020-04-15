# msu-csc232

This image is built from the latest alpine image and adds the following packages:

* `bash` - to allow students an interactive container if they so desire
* `g++` - used to compile programs written in c++ for CSC232
* `make` - used in conjunction with cmake to build targets from the source code
* `cmake` - used to create targets for make
* `git` - used to pull google test source code
* `doxygen` - used to generate documentation for student projects
* `graphviz` - used by doxygen

In addition to providing the above packages, two root-level directories are created for the source code and build targets. The source Dockerfile is found on [GitHub](https://github.com/professordaehn/msu-csc232).

Typical usage of this image is provided as a shell script with many projects. For example:

```
#!/usr/bin/env bash

IMAGE_NAME="professordaehn/msu-csc232"
CONTAINER_NAME="testRunner"

echo "Creating a container to run the google tests..."
docker create -it --name ${CONTAINER_NAME} ${IMAGE_NAME} sh

echo "Copying project files into container..."
docker cp . ${CONTAINER_NAME}:/project

echo "Starting ${CONTAINER_NAME}..."
docker start testRunner

echo "Executing the unit tests in ${CONTAINER_NAME}"
docker exec --workdir /project testRunner ./runner.sh

echo "Stopping ${CONTAINER_NAME}..."
docker stop testRunner

echo "Removing ${CONTAINER_NAME}..."
docker rm testRunner

echo "Done!"
```

