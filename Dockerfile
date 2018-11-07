FROM geo/tomcat85

# Add default user called status that can access the status part of the manager app
COPY tomcat-users.xml $CATALINA_HOME/conf/tomcat-users.xml
COPY manager-context.xml $CATALINA_HOME/webapps/manager/META-INF/context.xml

# Remove ALL installed web apps except the manager app
RUN rm -rf $CATALINA_HOME/webapps/docs \
		&& rm -rf $CATALINA_HOME/webapps/examples \
		&& rm -rf $CATALINA_HOME/webapps/host-manager \
		&& rm -rf $CATALINA_HOME/webapps/ROOT
	
