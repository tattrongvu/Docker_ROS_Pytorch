FROM nvidia/cuda:11.2.0-runtime-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update \
    && apt-get -y install \
    jq \
    git \
    vim \
    nano \
    curl \
    wget \
    xpra \
    swig \
    cmake \
    unzip \
    net-tools \
    virtualenv \
    ffmpeg curl \ 
    locales lsb-release \ 
    software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#=====================Install ROS Noetic=====================
RUN dpkg-reconfigure locales
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN apt-get update \
 && apt-get install -y --no-install-recommends ros-noetic-desktop-full
RUN apt-get install -y --no-install-recommends python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
RUN rosdep init \
 && rosdep fix-permissions \
 && rosdep update
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

#=============MOVEIT============
RUN apt-get -y update \
    && apt-get install -y --no-install-recommends ros-noetic-catkin python3-catkin-tools python3-osrf-pycommon

RUN apt-get install -y --no-install-recommends ros-noetic-moveit

RUN apt-get install -y --no-install-recommends ros-noetic-ros-control ros-noetic-ros-controllers


#=============PYTORCH============
RUN apt-get install -y pip
RUN pip install notebook
RUN pip install torch==1.9.0+cu111 torchvision==0.10.0+cu111 torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html

#=======================================



