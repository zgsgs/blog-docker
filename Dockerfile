FROM node:16-alpine as builder

WORKDIR /web

COPY package*.json ./
RUN npm install --registry=https://registry.npm.taobao.org

COPY . .
RUN npm run build

FROM nginx:latest
COPY ./nginx/conf/default.conf /etc/nginx/conf.d/default.conf

# 未指定镜像别名时 --from=0
COPY --from=builder /web/dist /usr/share/nginx/html

# 构建镜像指令
# docker build -t docker-deploy_web_v1 .
# 运行指令
# docker run -itd -p 7000:80 --name docker-deploy_web_container \
# -v E:\VSCode\Vue\docker-deploy\web\dist:/usr/share/nginx/html \
# docker-deploy_web_v1
