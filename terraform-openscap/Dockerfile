FROM centos:7

LABEL maintainer="Marcos-SlacKmaker"
LABEL version="1.0"
LABEL description="Imagem com os pacotes necessários para instalacao do OpenSCAP" 

RUN yum -y update && \
    yum -y install epel-release && \
    yum -y install openscap-utils && \
    yum -y install openscap-scanner && \
    yum -y install scap-security-guide

CMD ["oscap", "--version"]
