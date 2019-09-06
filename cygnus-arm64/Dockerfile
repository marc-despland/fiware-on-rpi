#
# Copyright 2016 Telefonica Investigación y Desarrollo, S.A.U
#
# This file is part of fiware-cygnus (FI-WARE project).
#
# fiware-cygnus is free software: you can redistribute it and/or modify it under the terms of the GNU Affero
# General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
# fiware-cygnus is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License
# for more details.
#
# You should have received a copy of the GNU Affero General Public License along with fiware-cygnus. If not, see
# http://www.gnu.org/licenses/.
#
# For those usages not covered by the GNU Affero General Public License please contact with iot_support at tid dot es
#

FROM bionic-arm64

MAINTAINER Orange

# Environment variables
ENV CYGNUS_USER "cygnus"
ENV CYGNUS_HOME "/opt/fiware-cygnus"
ENV CYGNUS_VERSION "1.15.0_SNAPSHOT"
ENV CYGNUS_CONF_PATH "/opt/apache-flume/conf"
ENV CYGNUS_CONF_FILE "/opt/apache-flume/conf/agent.conf"
ENV CYGNUS_AGENT_NAME "cygnus-ngsi"
ENV CYGNUS_LOG_LEVEL "INFO"
ENV CYGNUS_LOG_APPENDER "console"
ENV CYGNUS_SERVICE_PORT "5050"
ENV CYGNUS_JAVA_OPTS "-Xms2048m -Xmx4096m"
ENV CYGNUS_API_PORT "5080"
ENV CYGNUS_MULTIAGENT false
ENV CYGNUS_MONITORING_TYPE ""

# These variables are optional ENV variables to docker runtime
ENV CYGNUS_SKIP_CONF_GENERATION false

# MySQL options
ENV CYGNUS_MYSQL_HOST ""
ENV CYGNUS_MYSQL_PORT ""
# ENV CYGNUS_MYSQL_USER ""  # Warning: For development use only - Storing sensitive information in clear text is insecure
# ENV CYGNUS_MYSQL_PASS ""  # Warning: For development use only - Storing sensitive information in clear text is insecure
ENV CYGNUS_MYSQL_SKIP_CONF_GENERATION ""
ENV CYGNUS_MYSQL_ENABLE_ENCODING ""
ENV CYGNUS_MYSQL_ENABLE_GROUPING ""
ENV CYGNUS_MYSQL_ENABLE_NAME_MAPPINGS ""
ENV CYGNUS_MYSQL_SKIP_NAME_MAPPINGS_GENERATION ""
ENV CYGNUS_MYSQL_ENABLE_LOWERCASE ""
ENV CYGNUS_MYSQL_DATA_MODEL ""
ENV CYGNUS_MYSQL_ATTR_PERSISTENCE ""
ENV CYGNUS_MYSQL_BATCH_SIZE ""
ENV CYGNUS_MYSQL_BATCH_TIMEOUT ""
ENV CYGNUS_MYSQL_BATCH_TTL ""

# MongoDB / STH options
ENV CYGNUS_MONGO_HOSTS ""
# ENV CYGNUS_MONGO_USER "" # Warning: For development use only - Storing sensitive information in clear text is insecure
# ENV CYGNUS_MONGO_PASS "" # Warning: For development use only - Storing sensitive information in clear text is insecure
ENV CYGNUS_MONGO_SKIP_CONF_GENERATION ""
ENV CYGNUS_MONGO_ENABLE_ENCODING ""
ENV CYGNUS_MONGO_ENABLE_GROUPING ""
ENV CYGNUS_MONGO_ENABLE_NAME_MAPPINGS ""
ENV CYGNUS_MONGO_SKIP_NAME_MAPPINGS_GENERATION ""
ENV CYGNUS_MONGO_ENABLE_LOWERCASE ""
ENV CYGNUS_MONGO_DATA_MODEL ""
ENV CYGNUS_MONGO_ATTR_PERSISTENCE ""
ENV CYGNUS_MONGO_DB_PREFIX ""
ENV CYGNUS_MONGO_COLLECTION_PREFIX ""
ENV CYGNUS_MONGO_BATCH_SIZE ""
ENV CYGNUS_MONGO_BATCH_TIMEOUT ""
ENV CYGNUS_MONGO_BATCH_TTL ""
ENV CYGNUS_MONGO_DATA_EXPIRATION ""
ENV CYGNUS_MONGO_COLLECTIONS_SIZE ""
ENV CYGNUS_MONGO_MAX_DOCUMENTS ""
ENV CYGNUS_MONGO_IGNORE_WHITE_SPACES ""
ENV CYGNUS_STH_ENABLE_ENCODING ""
ENV CYGNUS_STH_ENABLE_GROUPING ""
ENV CYGNUS_STH_ENABLE_NAME_MAPPINGS ""
ENV CYGNUS_STH_SKIP_NAME_MAPPINGS_GENERATION ""
ENV CYGNUS_STH_ENABLE_LOWERCASE ""
ENV CYGNUS_STH_DATA_MODEL ""
ENV CYGNUS_STH_DB_PREFIX ""
ENV CYGNUS_STH_COLLECTION_PREFIX ""
ENV CYGNUS_STH_RESOLUTIONS ""
ENV CYGNUS_STH_BATCH_SIZE ""
ENV CYGNUS_STH_BATCH_TIMEOUT ""
ENV CYGNUS_STH_BATCH_TTL ""
ENV CYGNUS_STH_DATA_EXPIRATION ""

# CKAN options
ENV CYGNUS_CKAN_HOST ""
ENV CYGNUS_CKAN_PORT ""
ENV CYGNUS_CKAN_API_KEY ""
ENV CYGNUS_CKAN_SSL ""
ENV CYGNUS_CKAN_SKIP_CONF_GENERATION ""
ENV CYGNUS_CKAN_ENABLE_ENCODING ""
ENV CYGNUS_CKAN_ENABLE_GROUPING ""
ENV CYGNUS_CKAN_ENABLE_NAME_MAPPINGS ""
ENV CYGNUS_CKAN_SKIP_NAME_MAPPINGS_GENERATION ""
ENV CYGNUS_CKAN_DATA_MODEL ""
ENV CYGNUS_CKAN_ATTR_PERSISTENCE ""
ENV CYGNUS_CKAN_ORION_URL ""
ENV CYGNUS_CKAN_BATCH_SIZE ""
ENV CYGNUS_CKAN_BATCH_TIMEOUT ""
ENV CYGNUS_CKAN_BATCH_TTL ""
ENV CYGNUS_CKAN_BACKEND_MAX_CONNS ""
ENV CYGNUS_CKAN_BACKEND_MAX_CONSS_PER_ROUTE ""

# HDFS options
ENV CYGNUS_HDFS_HOST ""
ENV CYGNUS_HDFS_PORT ""
# ENV CYGNUS_HDFS_USER "" # Warning: For development use only - Storing sensitive information in clear text is insecure
# ENV CYGNUS_HDFS_TOKEN "" # Warning: For development use only - Storing sensitive information in clear text is insecure
ENV CYGNUS_HDFS_SKIP_CONF_GENERATION ""
ENV CYGNUS_HDFS_ENABLE_ENCODING ""
ENV CYGNUS_HDFS_ENABLE_GROUPING ""
ENV CYGNUS_HDFS_ENABLE_NAME_MAPPINGS ""
ENV CYGNUS_HDFS_SKIP_NAME_MAPPINGS_GENERATION ""
ENV CYGNUS_HDFS_ENABLE_LOWERCASE ""
ENV CYGNUS_HDFS_DATA_MODEL ""
ENV CYGNUS_HDFS_FILE_FORMAT ""
ENV CYGNUS_HDFS_BACKEND_IMPL ""
ENV CYGNUS_HDFS_BACKEND_MAX_CONNS ""
ENV CYGNUS_HDFS_BACKEND_MAX_CONNS_PER_ROUTE ""
ENV CYGNUS_HDFS_PASSWORD ""
ENV CYGNUS_HDFS_SERVICE_AS_NAMESPACE ""
ENV CYGNUS_HDFS_BATCH_SIZE ""
ENV CYGNUS_HDFS_BATCH_TIMEOUT ""
ENV CYGNUS_HDFS_BATCH_TTL ""
ENV CYGNUS_HDFS_BATCH_RETRY_INTERVALS ""
ENV CYGNUS_HDFS_HIVE ""
ENV CYGNUS_HDFS_KRB5_AUTH ""

# PostgreSQL options
ENV CYGNUS_POSTGRESQL_HOST ""
ENV CYGNUS_POSTGRESQL_PORT ""
# ENV CYGNUS_POSTGRESQL_USER "" # Warning: For development use only - Storing sensitive information in clear text is insecure
# ENV CYGNUS_POSTGRESQL_PASS "" # Warning: For development use only - Storing sensitive information in clear text is insecure
ENV CYGNUS_POSTGRESQL_SKIP_CONF_GENERATION ""
ENV CYGNUS_POSTGRESQL_ENABLE_ENCODING ""
ENV CYGNUS_POSTGRESQL_ENABLE_GROUPING ""
ENV CYGNUS_POSTGRESQL_ENABLE_NAME_MAPPINGS ""
ENV CYGNUS_POSTGRESQL_SKIP_NAME_MAPPINGS_GENERATION ""
ENV CYGNUS_POSTGRESQL_ENABLE_LOWERCASE ""
ENV CYGNUS_POSTGRESQL_ATTR_PERSISTENCE ""
ENV CYGNUS_POSTGRESQL_BATCH_SIZE ""
ENV CYGNUS_POSTGRESQL_BATCH_TIMEOUT ""
ENV CYGNUS_POSTGRESQL_BATCH_TTL ""
ENV CYGNUS_POSTGRESQL_ENABLE_CACHE ""

# Carto options
# ENV CYGNUS_CARTO_USER ""
# ENV CYGNUS_CARTO_KEY ""


# Docker Secrets Support - The following equivalents to storing clear text usernames and passwords are also available:
#
# ENV CYGNUS_MYSQL_USER_FILE
# ENV CYGNUS_MYSQL_PASS_FILE
# ENV CYGNUS_MONGO_USER_FILE
# ENV CYGNUS_MONGO_PASS_FILE
# ENV CYGNUS_HDFS_USER_FILE
# ENV CYGNUS_HDFS_TOKEN_FILE
# ENV CYGNUS_POSTGRESQL_USER_FILE
# ENV CYGNUS_POSTGRESQL_PASS_FILE
# ENV CYGNUS_CARTO_USER_FILE
# ENV CYGNUS_CARTO_KEY_FILE

# Orion options
ENV CYGNUS_ORION_SKIP_CONF_GENERATION ""
ENV CYGNUS_ORION_ENABLE_ENCODING ""
ENV CYGNUS_ORION_ENABLE_GROUPING ""
ENV CYGNUS_ORION_ENABLE_NAME_MAPPINGS ""
ENV CYGNUS_ORION_SKIP_NAME_MAPPINGS_GENERATION ""
ENV CYGNUS_ORION_ENABLE_LOWERCASE ""
ENV CYGNUS_ORION_HOST ""
ENV CYGNUS_ORION_PORT ""
ENV CYGNUS_ORION_SSL ""
ENV CYGNUS_ORION_USER ""
ENV CYGNUS_ORION_PASS ""
ENV CYGNUS_ORION_KEYSTONE_HOST ""
ENV CYGNUS_ORION_KEYSTONE_PORT ""
ENV CYGNUS_ORION_KEYSTONE_SSL ""
ENV CYGNUS_ORION_FIWARE ""
ENV CYGNUS_ORION_FIWARE_PATH ""
ENV CYGNUS_ORION_BATCH_SIZE ""
ENV CYGNUS_ORION_BATCH_TIMEOUT ""
ENV CYGNUS_ORION_BATCH_TTL ""
ENV CYGNUS_ORION_BATCH_RETRY_INTERVALS ""
ENV CYGNUS_ORION_ENABLE_CACHE ""



# PostgreGIS options
ENV CYGNUS_POSTGIS_HOST ""
ENV CYGNUS_POSTGIS_PORT ""
# ENV CYGNUS_POSTGIS_USER "" # Warning: For development use only - Storing sensitive information in clear text is insecure
# ENV CYGNUS_POSTGIS_PASS "" # Warning: For development use only - Storing sensitive information in clear text is insecure
ENV CYGNUS_POSTGIS_SKIP_CONF_GENERATION ""
ENV CYGNUS_POSTGIS_ENABLE_ENCODING ""
ENV CYGNUS_POSTGIS_ENABLE_GROUPING ""
ENV CYGNUS_POSTGIS_ENABLE_NAME_MAPPINGS ""
ENV CYGNUS_POSTGIS_SKIP_NAME_MAPPINGS_GENERATION ""
ENV CYGNUS_POSTGIS_ENABLE_LOWERCASE ""
ENV CYGNUS_POSTGIS_ATTR_PERSISTENCE ""
ENV CYGNUS_POSTGIS_BATCH_SIZE ""
ENV CYGNUS_POSTGIS_BATCH_TIMEOUT ""
ENV CYGNUS_POSTGIS_BATCH_TTL ""
ENV CYGNUS_POSTGIS_ENABLE_CACHE ""


# Elasticsearch options
ENV CYGNUS_ELASTICSEARCH_HOST ""
ENV CYGNUS_ELASTICSEARCH_PORT ""
ENV CYGNUS_ELASTICSEARCH_SSL ""
ENV CYGNUS_ELASTICSEARCH_SKIP_CONF_GENERATION ""
ENV CYGNUS_ELASTICSEARCH_INDEX_PREFIX ""
ENV CYGNUS_ELASTICSEARCH_MAPPING_TYPE ""
ENV CYGNUS_ELASTICSEARCH_BACKEND_MAX_CONNS ""
ENV CYGNUS_ELASTICSEARCH_BACKEND_MAX_CONSS_PER_ROUTE ""
ENV CYGNUS_ELASTICSEARCH_IGNORE_WHITE_SPACES ""
ENV CYGNUS_ELASTICSEARCH_ATTR_PERSISTENCE ""
ENV CYGNUS_ELASTICSEARCH_TIMEZONE ""
ENV CYGNUS_ELASTICSEARCH_CAST_VALUE ""
ENV CYGNUS_ELASTICSEARCH_CACHE_FLASH_INTERVAL_SEC ""


# ArcGis options
ENV CYGNUS_ARCGIS_URL ""
ENV CYGNUS_ARCGIS_USER "" 
ENV CYGNUS_ARCGIS_PASS ""
ENV CYGNUS_ELASTICSEARCH_SKIP_CONF_GENERATION ""
ENV CYGNUS_ARCGIS_ENABLE_ENCODING ""
ENV CYGNUS_ARCGIS_ENABLE_GROUPING ""
ENV CYGNUS_ARCGIS_ENABLE_NAME_MAPPINGS ""
ENV CYGNUS_ARCGIS_DATA_MODEL ""
ENV CYGNUS_ARCGIS_BATCH_SIZE ""
ENV CYGNUS_ARCGIS_BATCH_TIMEOUT ""
ENV CYGNUS_ARCGIS_BATCH_TTL ""

# NOTE: Configure correctly GIT_URL_CYGNUS and GIT_REV_CYGNUS for each git branch/fork used
ENV GIT_URL_CYGNUS "https://github.com/telefonicaid/fiware-cygnus.git"
# ENV GIT_URL_CYGNUS "https://github.com/myuser/fiware-cygnus.git"
ENV GIT_REV_CYGNUS "master"

ENV MVN_VER "3.5.4"
ENV MVN_HOME "/opt/apache-maven"

ENV FLUME_VER "1.9.0"
ENV FLUME_HOME "/opt/apache-flume"

ENV JAVA_VERSION "1.8.0"

# Install
#RUN \
    # Add Cygnus user
RUN  adduser ${CYGNUS_USER} 
RUN apt-get -y install software-properties-common && \
    add-apt-repository universe && \
    apt -y install netcat openjdk-8-jdk git && \
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-arm64 && \
    export MAVEN_OPTS="-Xmx1024M -Xss128M -XX:MetaspaceSize=512M -XX:MaxMetaspaceSize=1024M -Dfile.encoding=UTF-8 -Dproject.build.sourceEncoding=UTF-8 -Dmaven.compiler.useIncrementalCompilation=false -DdependencyLocationsEnabled=false -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -XX:+CMSClassUnloadingEnabled" && \
    export MAVEN_ARGS="-B -T8" && \
    /usr/bin/printf '\xfe\xed\xfe\xed\x00\x00\x00\x02\x00\x00\x00\x00\xe2\x68\x6e\x45\xfb\x43\xdf\xa4\xd9\x92\xdd\x41\xce\xb6\xb2\x1c\x63\x30\xd7\x92' > /etc/ssl/certs/java/cacerts && \
    /var/lib/dpkg/info/ca-certificates-java.postinst configure && \
    # For debug Maven
    # export MAVEN_ARGS="${MAVEN_ARGS} -X -e -Dmaven.compiler.verbose=true" && \
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
    echo "INFO: Build and install cygnus-common"
COPY cygnus/libext/cygnus-common-1.15.0_SNAPSHOT-jar-with-dependencies.jar ${FLUME_HOME}/plugins.d/cygnus/libext/
COPY cygnus/lib/cygnus-ngsi-1.15.0_SNAPSHOT-jar-with-dependencies.jar ${FLUME_HOME}/plugins.d/cygnus/lib/

RUN echo "INFO: Install Cygnus Application script" 
COPY cygnus-flume-ng ${FLUME_HOME}/bin/
RUN  chmod +x ${FLUME_HOME}/bin/cygnus-flume-ng && \
    echo "INFO: Instantiate some configuration files" && \
    cp ${CYGNUS_HOME}/cygnus-common/conf/log4j.properties.template ${FLUME_HOME}/conf/log4j.properties && \
    cp ${CYGNUS_HOME}/cygnus-ngsi/conf/grouping_rules.conf.template ${FLUME_HOME}/conf/grouping_rules.conf && \
    cp ${CYGNUS_HOME}/cygnus-ngsi/conf/name_mappings.conf.template ${FLUME_HOME}/conf/name_mappings.conf && \
    echo "INFO: Create Cygnus log folder" && \
    mkdir -p /var/log/cygnus && \
    echo "INFO: Cleanup to thin the final image... doing optimizations..." && \
    rm -rf /root/.m2 && rm -rf ${MVN_HOME} && rm -rf ${FLUME_HOME}/docs && rm -rf ${CYGNUS_HOME}/doc && rm -f /*.tar.gz && \
    echo "INFO: Java runtime not needs JAVA_HOME... Unsetting..." && \
    unset JAVA_HOME


COPY cygnus-entrypoint.sh / 
COPY agent.conf ${FLUME_HOME}/conf/ 
COPY agent.conf ${CYGNUS_HOME}/docker/cygnus-ngsi/agent.conf
COPY cartodb_keys.conf ${FLUME_HOME}/conf/

# Define the entry point
ENTRYPOINT ["/cygnus-entrypoint.sh"]

# Ports used by cygnus-ngsi
EXPOSE ${CYGNUS_SERVICE_PORT} ${CYGNUS_API_PORT}

