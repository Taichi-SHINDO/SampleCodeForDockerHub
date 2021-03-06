# CentOSをベースに
FROM centos

# 作成者
MAINTAINER Taichi Shindo

# RUN コマンドを使って、yum コマンドを実行してインストールする
RUN yum update -y && yum -y upgrade
RUN yum install -y sudo
RUN yum install -y passwd

# Javaのインストール
RUN yum install -y java-1.7.0-openjdk-devel.x86_64

# Tomcatのリポジトリを追加して、インストール
RUN yum install -y yum-priorities
RUN rpm -Uvh http://mirrors.dotsrc.org/jpackage/6.0/generic/free/RPMS/jpackage-release-6-3.jpp6.noarch.rpm
RUN yum install -y tomcat7-webapps

# Apacheのリポジトリを追加して、インストール
RUN yum install -y httpd

# EXPOSE コマンドを使って、ポート8080を解放
#EXPOSE 8080

# Analyticsに必要なファイルをホストOSから取得
###COPY ./war/fax.war /usr/share/tomcat7/webapps/fax.war
#ADD ./var/admage/ /var/admage/
#ADD ./var/fox/ /var/fox/
###COPY ./lib/ /usr/share/tomcat7/lib/


# ENTORYPOINT コマンドを使って、コンテナ起動時に実行するコマンドを与える
### ENTRYPOINT /etc/init.d/tomcat7 start && /bin/bash
