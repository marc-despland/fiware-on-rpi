FROM bionic-arm64

MAINTAINER Orange

ENV ORION_USER orion
ENV GIT_REV_ORION master
ENV CLEAN_DEV_TOOLS 1

WORKDIR /opt

COPY mongo-cxx-driver-legacy-1.1.2.patch /opt/

RUN \
    adduser ${ORION_USER} && \
    # Install dependencies
    apt-get -y install software-properties-common && \
    add-apt-repository universe && \
    apt -y install \
        libboost-all-dev \
        bzip2 \
        cmake \
        libgnutls28-dev \
        libgcrypt11-dev \
        libcurl4-gnutls-dev \
        libssl-dev \
        uuid-dev \
        make \
        netcat \
        git \
        gcc \
        g++ \
        tar \
	scons \
	curl \
        libsasl2-dev && \
    # Install libmicrohttpd from source
    curl -kOL http://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.9.48.tar.gz && \
    tar xvf libmicrohttpd-0.9.48.tar.gz && \
    cd libmicrohttpd-0.9.48 && \
    ./configure --disable-messages --disable-postprocessor --disable-dauth && \
    make && \
    make install && \
    ldconfig && \
    # Install mongodb driver from source
    curl -kOL https://github.com/mongodb/mongo-cxx-driver/archive/legacy-1.1.2.tar.gz && \
    tar xfz legacy-1.1.2.tar.gz && \
    cd mongo-cxx-driver-legacy-1.1.2 && \
    patch -p1 <../mongo-cxx-driver-legacy-1.1.2.patch && \
    scons --disable-warnings-as-errors && \
    scons install --prefix=/usr/local --use-sasl-client --ssl --disable-warnings-as-errors && \
    # Install rapidjson from source
    curl -kOL https://github.com/miloyip/rapidjson/archive/v1.0.2.tar.gz && \
    tar xfz v1.0.2.tar.gz && \
    mv rapidjson-1.0.2/include/rapidjson/ /usr/local/include && \
    # Install orion from source
    git clone https://github.com/telefonicaid/fiware-orion && \
    cd fiware-orion && \
    git checkout ${GIT_REV_ORION} && \
    make && \
    make install && \
    # reduce size of installed binaries
    strip /usr/bin/contextBroker && \
    # create needed log and run paths
    mkdir -p /var/log/contextBroker && \
    mkdir -p /var/run/contextBroker && \
    chown ${ORION_USER} /var/log/contextBroker && \
    chown ${ORION_USER} /var/run/contextBroker && \
    cd /opt && \
    if [ ${CLEAN_DEV_TOOLS} -eq 0 ] ; then yum clean all && exit 0 ; fi && \
    # cleanup sources, dev tools, locales and yum cache to reduce the final image size
    rm -rf /opt/libmicrohttpd-0.9.48.tar.gz \
           /usr/local/include/microhttpd.h \
           /usr/local/lib/libmicrohttpd.* \
           /opt/libmicrohttpd-0.9.48 \
           /opt/legacy-1.1.2.tar.gz \
           /opt/mongo-cxx-driver-legacy-1.1.2 \
           /usr/local/include/mongo \
           /usr/local/lib/libmongoclient.a \
           /opt/rapidjson-1.0.2 \
           /opt/v1.0.2.tar.gz \
           /usr/local/include/rapidjson \
           /opt/fiware-orion \
           # We don't need to manage Linux account passwords requisites: lenght, mays/mins, etc.
           # This cannot be removed using yum as yum uses hard dependencies and doing so will 
           # uninstall essential packages
           /usr/share/cracklib \
           # We don't need glibc locale data. This cannot be removed using yum as yum uses hard 
           # dependencies and doing so will uninstall essential packages
           /usr/share/i18n /usr/{lib,lib64}/gconv
#RUN apt-get -y remove git \ 
#	cmake gcc g++ 
#RUN apt-get -y remove	libgnutls28-dev \
#	libgcrypt11-dev \
#	libcurl4-gnutls-dev \
#	libssl-dev \
#	uuid-dev \
#	make \
#	scons && \
#    apt -y autoremove && \
#    apt-get clean
WORKDIR /
ENTRYPOINT ["/usr/bin/contextBroker","-fg", "-multiservice", "-ngsiv1Autocast" ]
EXPOSE 1026

