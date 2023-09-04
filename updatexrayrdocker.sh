#!/bin/bash

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
    # 这里你需要根据你的实际情况重新配置容器的启动参数，例如端口映射、挂载的配置文件等
    docker run -d --name xrayr ghcr.io/xrayr-project/xrayr:master

    echo "容器 $container 已更新完成"
done

echo "所有 xrayr 容器已更新到最新版本"
