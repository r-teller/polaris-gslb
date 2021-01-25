FROM centos:centos7

RUN yum install -y epel-release
RUN yum install -y python34 python34-pip python34-PyYAML pdns pdns-backend-remote memcached pip3 install python3-memcached python-daemon-3K

RUN mkdir -p /var/tmp/polaris-gslb
RUN git clone https://github.com/polaris-gslb/polaris-gslb.git /var/tmp/polaris-gslb

RUN python3 /var/tmp/polaris-gslb/setup.py install

ENV PATH=$PATH:/opt/python3/bin
ENV POLARIS_INSTALL_PREFIX=/opt/polaris

RUN cp /opt/polaris/etc/pdns.conf.dist /etc/pdns/pdns.conf

WORKDIR /etc/default/polaris