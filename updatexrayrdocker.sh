#!/bin/bash

# 0. 切换到用户主目录
cd ~

# 1. 停止并删除正在运行的 xrayr 容器
docker stop xrayr
docker rm xrayr

# 2. 删除旧的 xrayr 镜像
docker rmi $(docker images ghcr.io/xrayr-project/xrayr -q)

# 3. 拉取最新的 xrayr 镜像
docker pull ghcr.io/xrayr-project/xrayr:master

# 4. 运行新的 xrayr 容器
docker run --restart=always --name xrayr -d -v ~/config.yml:/etc/XrayR/config.yml --network=host ghcr.io/xrayr-project/xrayr:master

# 5. 打印当前运行的容器状态
docker ps -a
