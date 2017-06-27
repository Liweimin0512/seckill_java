# seckill
JAVA高并发秒杀项目，基于SSM框架

# 关于releases
你可以看到4个tag，分别对应了开发的四个部分，分别是：
+ dao层的实现
+ service层的实现
+ web层的实现
+ 高并发优化

## 一些配置的官方地址
[logback配置](http://logback.qos.ch/manual/configuration.html)
[spring配置](http://docs.spring.io/spring/docs/)
[mybatis配置](http://mybatis.github.io/mybatis-3/zh/index.html)

## maven命令创建web骨架项目
```
mvn archetype:create -DgroupId=org.seckill -DartifactId=seckill -DarchetypeArtifactId=maven-archetype-webapp
```
## Spring整合Mybatis
### 整合目标
+ 更少的编码：只写接口，不写实现。
+ 更少的配置
+ 足够的灵活性

## 高并发优化方案
+ 前端控制：暴露接口，按钮防重复
+ 动静态数据分离：CDN缓存，后端缓存
+ 事务竞争优化：减少事务锁时间
