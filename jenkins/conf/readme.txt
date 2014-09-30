-httpPort=$HTTP_PORT 	
Runs Jenkins listener on port $HTTP_PORT using standard http protocol. The default is port 8080. To disable (because you're using https), use port -1.

--httpListenAddress=$HTTP_HOST 	Binds Jenkins to the IP address represented by $HTTP_HOST. The default is 0.0.0.0 — i.e. listening on all available interfaces.
For example, to only listen for requests from localhost, you could use: --httpListenAddress=127.0.0.1

--httpsPort=$HTTP_PORT 	Uses HTTPS protocol on port $HTTP_PORT
--httpsListenAddress=$HTTPS_HOST 	Binds Jenkins to listen for HTTPS requests on the IP address represented by $HTTPS_HOST.
--prefix=$PREFIX
	Runs Jenkins to include the $PREFIX at the end of the URL.
For example, to make Jenkins accessible at http://myServer:8080/jenkins, set --prefix=/jenkins
--ajp13Port=$AJP_PORT 	Runs Jenkins listener on port $AJP_PORT using standard AJP13 protocol. The default is port 8009. To disable (because you're using https), use port -1.
--ajp13ListenAddress=$AJP_HOST 	Binds Jenkins to the IP address represented by $AJP_HOST. The default is 0.0.0.0 — i.e. listening on all available interfaces.
--argumentsRealm.passwd.$ADMIN_USER 	Sets the password for user $ADMIN_USER. If Jenkins security is turned on, you must log in as the $ADMIN_USER in order to configure Jenkins or a Jenkins project. NOTE: You must also specify that this user has an admin role. (See next argument below).
--argumentsRealm.roles.$ADMIN_USER=admin 	Sets that $ADMIN_USER is an administrative user and can configure Jenkins if Jenkins' security is turned on. See Securing Jenkins for more information.
-Xdebug -Xrunjdwp:transport=dt_socket,address=$DEBUG_PORT,server=y,suspend=n 	Sets debugging on and you can access debug on $DEBUG_PORT.
-logfile=$LOG_PATH/winstone_`date +"%Y%m-%d_%H-%M"`.log 	Logging to desired file
-XX:PermSize=512M -XX:MaxPermSize=2048M -Xmn128M -Xms1024M -Xmx2048M 	referring to these options for Oracle Java 
