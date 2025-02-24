# Jenkins 部署与基本配置

Jenkins 只是一个调度平台,其本身并不能完成项目的构建部署 

Jenkins 需要安装各种插件,可能还需要编写Shell,python脚本等才能调用和集成众多的组件来实现复杂的 构建部署功能

## Jenkins 的安装

Jenkins支持多种安装方法 

*   包安装 
*   JAVA的WAR文件  
*   容器运行

系统要求 

最低推荐配置: 

*   256MB可用内存 
*   1GB可用磁盘空间(作为一个 docker容器运行jenkins的话推荐10GB)

为小团队推荐的硬件配置: 

*   1GB+可用内存 
*   50 GB+ 可用磁盘空间 

JAVA 软件配置: 

*   Java 8—无论是Java运行时环境（JRE）还是Java开发工具包（JDK）都可以。
*    Jenkins requires Java 11 or 17 since Jenkins 2.357 and LTS 2.361.1. 

### 系统准备

```shell
#设置语言环境，防止后期Jenkins汉化出问题
localectl set-locale LANG=en_US.UTF-8
```

###  JAVA 环境

 Jenkins requires Java 11 or 17 since Jenkins 2.357 and LTS 2.361.1. 

![image-20250224111708944](pic/image-20250224111708944.png)

```shell
#安装openjdk
apt update && apt -y install openjdk-17-jdk
```

### 包安装 Jenkins

[Debian Jenkins Packages](https://pkg.jenkins.io/debian-stable/)

```
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
    
sudo apt-get update
sudo apt-get install fontconfig openjdk-17-jdk
sudo apt-get install jenkins
```

```shell
# 默认随机密码
cat /var/lib/jenkins/secrets/initialAdminPassword
```

### 基于 WAR 包直接部署

[War Jenkins Packages](https://get.jenkins.io/war-stable/)

```shell
wget https://get.jenkins.io/war-stable/xxx

java -jar  jenkins.war  --httpPort=9090
```

 