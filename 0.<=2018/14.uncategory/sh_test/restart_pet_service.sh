ps -ef|grep '^.*java.*'"tomcat-pet-service"'.*$'|grep -v grep|awk '{print $2}'|xargs kill -9
/opt/apache-tomcat-pet-service/bin/startup.sh
tail -f /opt/apache-tomcat-pet-service/logs/catalina.out
