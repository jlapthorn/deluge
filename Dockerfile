FROM centos
MAINTAINER jlapthorn
RUN rpm -ihv https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install wget python2-pyxdg python-twisted-core python-twisted-web rb_libtorrent-python2 python-setuptools python-mako

RUN wget http://download.deluge-torrent.org/source/deluge-1.3.11.tar.gz && tar xvf deluge-1.3.11.tar.gz && rm deluge-1.3.11.tar.gz
RUN cd /deluge-1.3.11 && python setup.py install 

VOLUME ["/config","/data"]
ADD ./start.sh /start.sh
RUN chmod u+x /start.sh
EXPOSE 8112
CMD ["/start.sh"]

