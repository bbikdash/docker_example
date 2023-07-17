# @author Bassam Bikdash, February 2023
# https://hub.docker.com/r/nvidia/cuda

FROM nvidia/cuda:11.8.0-base-ubuntu20.04
CMD nvidia-smi

# Prevent dpkg from asking for user input during installation
ARG DEBIAN_FRONTEND=noninteractive

# Install additional dependencies
# Try not to change the order of the installations
RUN apt-get update && apt-get upgrade -y && apt-get install --no-install-recommends --no-install-suggests -y curl wget
RUN apt-get install -q -y unzip apt-utils build-essential libssl-dev libffi-dev python3-dev python3-pip libjpeg-dev zlib1g-dev libsm6 libxext6 libxrender-dev
RUN apt-get install -q -y vim
RUN apt-get install -q -y ffmpeg
RUN pip install --upgrade pip
RUN pip install scikit-build
RUN pip install setuptools requests
RUN pip install opencv-python
RUN pip install numpy scipy sympy matplotlib pandas tqdm pytorch-lightning "pytorch-lightning[extra]" torchmetrics tensorboard tensorboardX SimpleITK Shapely imageio vtk PyYAML carla
RUN pip install -U albumentations scikit-learn scikit-image
RUN pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113

