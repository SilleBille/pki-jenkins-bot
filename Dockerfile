FROM registry.fedoraproject.org/fedora:26
MAINTAINER [Dinesh Prasanth M K dmoluguw@redhat.com]
ENV container=docker LANG=en_US.utf8 LANGUAGE=en_US.utf8 LC_ALL=en_US.utf8

RUN echo 'deltarpm = false' >> /etc/dnf/dnf.conf \
    && dnf update -y dnf \
    && dnf install -y dnf-plugins-core sudo wget \
    && dnf config-manager --set-enabled updates-testing \
    && dnf install -y python-srpm-macros \
    && dnf install -y @buildsys-build @development-tools \
&& dnf clean all

ENTRYPOINT [ "/usr/sbin/init" ]
