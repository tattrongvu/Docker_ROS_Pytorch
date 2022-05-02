FROM trong_ros_cudabase:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update \
    && apt-get -y install \
    libosmesa6-dev \
    libgl1-mesa-glx \
    libglfw3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#=====================MUJOCO==================

COPY ./patchelf_0.9_amd64.elf /usr/local/bin/patchelf

RUN chmod +x /usr/local/bin/patchelf

ENV LANG C.UTF-8

COPY ./mujoco200_linux.zip ./mujoco200_linux.zip

RUN mkdir -p /root/.mujoco \
    && unzip mujoco200_linux.zip -d /root/.mujoco \
    && mv /root/.mujoco/mujoco200_linux  /root/.mujoco/mujoco200 \
    && rm mujoco200_linux.zip

COPY ./mjkey.txt /root/.mujoco/
COPY ./mjkey.txt /root/.mujoco/mujoco200/bin

ENV LD_LIBRARY_PATH /root/.mujoco/mujoco200/bin:${LD_LIBRARY_PATH}

ADD requirements.txt /usr/local/requirements.txt

RUN pip install --upgrade pip && pip install --no-cache-dir -r /usr/local/requirements.txt


#================CUSTOM ROS WORKSPACE============
#================================
#jupyter notebook password
#cloudywithachanceofamonia
ADD jupyter_notebook_config.json /root/.jupyter/jupyter_notebook_config.json

ADD run_servers.sh /run_servers.sh
WORKDIR /
CMD sh run_servers.sh && tail -f /dev/null

