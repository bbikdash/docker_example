# @author Bassam Bikdash, February 2024
FROM python:3.10

# Prevent dpkg from asking for user input during installation
ARG DEBIAN_FRONTEND=noninteractive

# Install additional dependencies
# Try not to change the order of the installations
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -q -y curl wget unzip git vim ffmpeg htop pciutils util-linux rsync
RUN apt-get update && apt-get install -q -y lsb-release && apt-get clean all


# Install pip packages
RUN pip install --upgrade pip
RUN pip install -U scikit-build scikit-learn scikit-image
RUN pip install -U setuptools requests wheel
RUN pip install -U opencv-python
RUN pip install -U numpy scipy sympy matplotlib pandas tqdm loguru SimpleITK shapely imageio vtk carla PyYAML bidict
RUN pip install -U git+https://github.com/albumentations-team/albumentations
RUN pip install -U torch torchvision torchaudio
RUN pip install -U lightning torchmetrics tensorboard
RUN pip install -U transformers huggingface xformers onnx onnxsim
RUN pip install -U 'jsonargparse[signatures]>=4.2.1'

# Modify .bashrc
RUN echo "alias ll='ls -alh'" >> ~/.bashrc
