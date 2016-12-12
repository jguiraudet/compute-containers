

all:	dit4c-container-jupyterlab



dit4c-container-base: 
	docker build --tag jguiraudet/dit4c-container-base:8.0-cudnn5-devel dockerfile-dit4c-container-base

dit4c-container-ipython: dit4c-container-base 
	docker build --tag jguiraudet/dit4c-container-ipython:8.0-cudnn5-devel dockerfile-dit4c-container-ipython

dit4c-container-jupyterlab: dit4c-container-ipython 
	docker build --tag jguiraudet/dit4c-container-jupyterlab:8.0-cudnn5-devel dockerfile-dit4c-container-jupyterlab

# Create user shared data container
user-data:
	docker volume create --name $USER
	docker run -v $USER:/home/researcher/shared --name data_${USER} jguiraudet/dit4c-container-base:8.0-cudnn5-devel \
		 chown 1000:1000 /home/researcher/shared 

run:
	xdg-open http://localhost:32771
	nvidia-docker run --rm -p 32771:8080 --volumes-from data_${USER}  jguiraudet/dit4c-container-jupyterlab:8.0-cudnn5-devel



## Build the CUDA images
centos:
	docker pull centos:7
cuda: centos
	# https://github.com/NVIDIA/nvidia-docker/wiki/Building-images-locally
	# Build all the CUDA images for CentOS 7
	# -> cuda:8.0-devel -> nvidia/cuda:8.0-cudnn5-devel
	make -C nvidia-docker/centos-7/cuda 8.0-cudnn5-devel 


#	sed -ri 's#^FROM centos:7#FROM cuda:8.0-cudnn5-devel#' dockerfile-dit4c-container-base/Dockerfile

