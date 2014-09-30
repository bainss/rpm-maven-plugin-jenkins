#!/bin/bash
#
# Startup script for the Jenkins Continuous Integration server
#
DESC="Jenkins CI Server"
NAME=jenkins
PIDFILE=/var/run/$NAME.pid
RUN_AS=jenkins
JENKINS_HOME=/opt/jenkins
JENKINS_LOGS="$JENKINS_HOME/logs/startup.log"
JENKINS_WAR="$JENKINS_HOME/bin/jenkins-1.581.war"
JENKINS_CONF=$(<"$JENKINS_HOME/conf/jenkins_java_opts")
JAVA_JAR="/usr/bin/java -jar " 
JENKINS_PROC=`ps -ef | grep $JENKINS_WAR | grep -v grep | awk '{ print $2 }'`
START_COMMAND=" $JENKINS_WAR $JENKINS_CONF  > $JENKINS_LOGS 2>&1 & "
STOP_COMMAND="kill $JENKINS_PROC"

# Source function library.
. /etc/rc.d/init.d/functions
 
# Get config.
. /etc/sysconfig/network
 
# Check that networking is up.
[ "${NETWORKING}" = "no" ] && exit 0
 
 
start(){
 echo -n $"Starting Jenkins service: "
 su - $RUN_AS -c  "$JAVA_JAR  $START_COMMAND"
 RETVAL=$?
 echo
}
 
stop(){
 action $"Stopping Jenkins service: "
 su - $RUN_AS -c  "$STOP_COMMAND" 
 RETVAL=$?
 echo
}
 
status(){
 numproc=`ps -ef | grep $JENKINS_WAR |grep -v grep | wc -l`
 if [ $numproc -gt 0 ]; then
  echo "Jenkins is running..."
  else
  echo "Jenkins is stopped..."
 fi
}
 
restart(){
  stop
  sleep 5
  start
}
 
 
# See how we were called.
case "$1" in
start)
 start
 ;;
stop)
 stop
 ;;
status)
 status
 ;;
restart)
 restart
 ;;
*)
 echo $"Usage: $0 {start|stop|status|restart}"
 exit 1
esac
 
exit 0
