#!/bin/bash
echo Password123! > /opt/lucee/server/lucee-server/context/password.txt
rm -rf /usr/local/tomcat/conf/web.xml
cp /tmp/web.xml /usr/local/tomcat/conf/.
cp /tmp/servlet-filter-utils-1.1.1.jar /usr/local/tomcat/lib/.
catalina.sh run