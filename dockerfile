FROM centos:8

RUN dnf --quiet --assumeyes install libxslt dmidecode which net-tools yum-utils pciutils unzip

ADD /sum-8.7.0-52.rhel8.x86_64.rpm /sum-8.7.0-52.rhel8.x86_64.rpm
RUN rpm -i sum-8.7.0-52.rhel8.x86_64.rpm

ADD ./start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 63002

ENTRYPOINT ["/start.sh"]

HEALTHCHECK --interval=5m --timeout=5s \
    CMD curl -fk https://127.0.0.1:63002 &>/dev/null && echo "Ok" || echo "No Connection" && exit 1