#!/bin/bash

# 切换到用户的主目录
cd ~

# 拉取最新的 xrayr master 版本
docker pull ghcr.io/xrayr-project/xrayr:master

# 获取所有正在运行的 xrayr 容器的 ID
containers=$(docker ps | grep "ghcr.io/xrayr-project/xrayr:master" | awk '{print $1}')

# 遍历每一个容器
for container in $containers
do
    echo "正在停止容器: $container"
    docker stop $container

    echo "正在删除容器: $container"
    docker rm $container

    echo "启动新的 xrayr 容器"
    docker run -d --name xrayr ghcr.io/xrayr-project/xrayr:master

    echo "容器 $container 已更新完成"
done

# 显示所有容器的状态
docker ps -a
