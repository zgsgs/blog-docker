# Docker Deploy

Docker 部署前后端项目

## 待解决

- [ ] 每次修改都需要重新移除容器、重新打包、唤起容器。流程繁琐，探索一下如何在修改后可以对修改容器单独更新的办法
- [ ] 目前前端容器单独使用了 nginx 容器部署，如何把 nginx 单独抽离出来

## 目录

## 遇到问题

## 知识碎片

> docker-compose.yml 文件更改后想使之立刻生效，但是不想手动删除已经建立的 container 等信息可以运行下面命令
```
docker-compose up --force-recreate -d
```
