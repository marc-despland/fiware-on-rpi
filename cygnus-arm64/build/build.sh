#!/bin/bash
    echo "INFO: Getting apache preferred site and obtain URLs for Maven and Flume..." && \
    APACHE_DOMAIN="$(curl -s 'https://www.apache.org/dyn/closer.cgi?as_json=1' | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["preferred"]')" \
      || APACHE_DOMAIN="http://archive.apache.org/dist/" && \
    MVN_URL="${APACHE_DOMAIN}maven/maven-3/${MVN_VER}/binaries/apache-maven-${MVN_VER}-bin.tar.gz" && \
    FLUME_URL="${APACHE_DOMAIN}flume/${FLUME_VER}/apache-flume-${FLUME_VER}-bin.tar.gz" && \
    echo -e $'INFO: Java version <'${JAVA_VERSION}'>\n'$(java -version)'\nINFO: Apache domain <'${APACHE_DOMAIN}'>\nINFO: URL MAVEN <'${MVN_URL}'>\nINFO: URL FLUME <'${FLUME_URL}'>' && \
    echo "INFO: Download and install Maven and Flume..."  && \
    apt -y install curl python &&\
    echo "MAVEN URL : " ${MVN_URL} && \
    curl --remote-name --location --insecure --silent --show-error "${MVN_URL}" && \
    tar xzf apache-maven-${MVN_VER}-bin.tar.gz && \
    mv apache-maven-${MVN_VER} ${MVN_HOME} && \
    echo "FLUME_URL : " ${FLUME_URL} && \
    curl --remote-name --location --insecure --silent --show-error "${FLUME_URL}" && \
    tar zxf apache-flume-${FLUME_VER}-bin.tar.gz && \
    mv apache-flume-${FLUME_VER}-bin ${FLUME_HOME} && \
    mkdir -p ${FLUME_HOME}/plugins.d/cygnus && \
    mkdir -p ${FLUME_HOME}/plugins.d/cygnus/lib && \
    mkdir -p ${FLUME_HOME}/plugins.d/cygnus/libext && \
    chown -R cygnus:cygnus ${FLUME_HOME} && \
    # Make a shallow clone to help reduce final image size
    echo "INFO: Cloning Cygnus using <${GIT_URL_CYGNUS}> and <${GIT_REV_CYGNUS}>" && \
    git clone ${GIT_URL_CYGNUS} ${CYGNUS_HOME} && \
    cd ${CYGNUS_HOME} && \
    git checkout ${GIT_REV_CYGNUS} && \
    echo "INFO: Build and install cygnus-common" && \
    cd ${CYGNUS_HOME}/cygnus-common && \
    ${MVN_HOME}/bin/mvn ${MAVEN_ARGS} clean compile exec:exec assembly:single && \
    cp target/cygnus-common-${CYGNUS_VERSION}-jar-with-dependencies.jar ${FLUME_HOME}/plugins.d/cygnus/libext/ && \
    ${MVN_HOME}/bin/mvn install:install-file -Dfile=${FLUME_HOME}/plugins.d/cygnus/libext/cygnus-common-${CYGNUS_VERSION}-jar-with-dependencies.jar -DgroupId=com.telefonica.iot -DartifactId=cygnus-common -Dversion=${CYGNUS_VERSION} -Dpackaging=jar -DgeneratePom=false && \
    echo "INFO: Build and install cygnus-ngsi" && \
    cd ${CYGNUS_HOME}/cygnus-ngsi && \
    ${MVN_HOME}/bin/mvn ${MAVEN_ARGS} clean compile exec:exec assembly:single && \
    cp target/cygnus-ngsi-${CYGNUS_VERSION}-jar-with-dependencies.jar ${FLUME_HOME}/plugins.d/cygnus/lib/ && \
    echo "INFO: Install Cygnus Application script" && \
    cp ${CYGNUS_HOME}/cygnus-common/target/classes/cygnus-flume-ng /opt/build/ && \
    cp -R ${FLUME_HOME}/plugins.d/cygnus /opt/build/
