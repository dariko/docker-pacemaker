FROM centos:7

RUN yum install -y epel-release && \
    yum clean all
RUN yum install -y pacemaker corosync python-pip && \
    yum clean all
RUN pip install https://github.com/ClusterLabs/crmsh/archive/3.0.3.zip
RUN pip install supervisor

COPY corosync.conf /etc/corosync/corosync.conf
COPY supervisord.conf /supervisord.conf

CMD supervisord \
        --nodaemon \
        --configuration /supervisord.conf
