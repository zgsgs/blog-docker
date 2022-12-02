# 后端项目的镜像配置文件
# 项目依赖的镜像和版本号,起个别名 builder
FROM node:16-alpine as builder
# 定义匿名数据卷。在启动容器时忘记挂载数据卷，会自动挂载到匿名卷。
VOLUME /tmp
# 对外暴露端口 后端项目所使用的的容器中的端口号
EXPOSE 7001

# 指定后端项目在容器的工作目录，不需要提前创建
WORKDIR /server

# 拷贝宿主机上后端项目的 package 文件到所在容器中的工作目录下
COPY package*.json ./
# 安装依赖 --production 仅安装生产依赖
RUN npm install --production --registry=https://registry.npm.taobao.org

COPY . .

CMD [ "npm", "start" ]
# https://www.runoob.com/docker/docker-dockerfile.html
# ENTRYPOINT [ "npm", "start" ]

# 构建镜像指令
# docker build -t docker-deploy_server_v1 .
# 运行指令
# docker run -itd -p 7001:7001 --name docker-deploy_server_container docker-deploy_server_v1
