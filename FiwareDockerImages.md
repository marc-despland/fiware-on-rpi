# Creation of FIWARE Docker Images

Standard FIWARE images are not build for ARM64 architecture, so we can't use them.

We have to create our own images for ARM64 

## Creation of a base images

First step is to create the base image to use, based on our Ubunutu bionic version.
The [official documentation](https://docs.docker.com/develop/develop-images/baseimages/) explain how to do it.

```
$ cd /home/ubuntu/projects
$ sudo debootstrap bionic bionic > /dev/null
$ sudo tar -C bionic -c . | docker import - bionic-arm64
```

You can check with docker images, that the image exists.

```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
bionic-arm64        latest              9310b5d78775        2 days ago          274MB
```

## Creation of Orion

I have updated the official Dockerfile to make it work on ubuntu. To allow the compillation you really need to have activated the swap as descibe in the hardware section.

```
$ cd orion-arm64
$ docker build -t orion-arm64 .
```

## Creation of Comet

This one is quite easy

```
$ cd comet-arm64
$ git clone https://github.com/telefonicaid/fiware-sth-comet.git
$ cd fiware-sth-comet
$ patch -p1 < ../fiware-sth-comet.patch
$ docker build -t comet-arm64 .
```

## Creation of Cygnus

This one is a nightmare. The RPI3 B+ haven't enough memory in order to complete the build of the images. So in order to createing it i have build the jar files on another computer with the same version of ubuntu and more memory, then copy then into the image.

The build process of this image is not optimized but it works !

```
$ cd cygnus-arm64
$ docker build -t cygnus-arm64 .
```