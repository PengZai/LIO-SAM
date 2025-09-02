#!/bin/bash

PROJECT_NAME="lio-sam"

IMAGE_NAME="lio-sam:noetic-ros"
DATA_PATH="/media/${USER}/zhipeng_usb/datasets"
DATA_PATH2="/media/${USER}/zhipeng_8t1/datasets"
# Pick up config image key if specified
if [[ ! -z "${CONFIG_DATA_PATH}" ]]; then
    DATA_PATH=$CONFIG_DATA_PATH
fi




docker build -t $IMAGE_NAME -f "${HOME}/vscode_projects/LIO-SAM/catkin_ws/src/LIO-SAM/Dockerfile_for_dev" .


xhost +local:docker

docker run \
    -e DISPLAY=$DISPLAY \
    -v ~/.Xauthority:/root/.Xauthority:rw \
    --network host \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v ${HOME}/vscode_projects/LIO-SAM/catkin_ws:/root/catkin_ws \
    -v ${DATA_PATH}:/root/datasets \
    -v ${DATA_PATH2}:/root/datasets2 \
    --privileged \
    --cap-add sys_ptrace \
    --runtime=nvidia \
    --gpus all \
    --env NVIDIA_VISIBLE_DEVICES=all \
    --env NVIDIA_DRIVER_CAPABILITIES=all \
    -it --name $PROJECT_NAME $IMAGE_NAME /bin/bash

# xhost -local:docker