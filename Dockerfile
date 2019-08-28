FROM gcr.io/cloudshell-images/cloudshell:latest

ARG AMASS_VERSION=3.0.27

RUN apt-get -y update
RUN apt-get -y install nmap

RUN curl -L https://github.com/OWASP/Amass/releases/download/v${AMASS_VERSION}/amass_v${AMASS_VERSION}_linux_amd64.zip \ 
> amass_v${AMASS_VERSION}_linux_amd64.zip && \
unzip amass_v${AMASS_VERSION}_linux_amd64.zip && \
rm amass_v${AMASS_VERSION}_linux_amd64.zip && \
mv amass_v${AMASS_VERSION}_linux_amd64 /opt

RUN echo "export PATH=\$PATH:/opt/amass_v${AMASS_VERSION}_linux_amd64" >> /etc/profile
