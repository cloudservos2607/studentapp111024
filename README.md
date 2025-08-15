mysql connector issue
mysql-connector-java-8.0.30.jar

Access denied for user 'student'@'%' to database 'test'

url's:
GET
http://52.184.136.118:8080/CustomWebApp/student/list
http://52.184.136.118:8080/CustomWebApp/student/1

POST
curl --location 'http://52.184.136.118:8080/CustomWebApp/student' \
--header 'Content-Type: application/json' \
--data '{
	  "studentName": "tej",
      "studentAddr": "us",
      "studentAge": "2",
      "studentQulaification": "bca",
      "studentPercent": "99",
      "studentYearPassword": "2018"
    }'

raw - select - json

{
	  "studentName": "tej",
      "studentAddr": "us",
      "studentAge": "2",
      "studentQulaification": "bca",
      "studentPercent": "99",
      "studentYearPassword": "2018"
    }

-----------------
tomcat8.5

sudo apt update
sudo apt install openjdk-8-jdk -y
java -version


wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.100/bin/apache-tomcat-8.5.100.tar.gz
sudo tar -zxvf apache-tomcat-8.5.100.tar.gz -C /opt/
cd /opt/apache-tomcat-8.5.100

sudo adduser --system --group tomcat8

sudo chown -R tomcat8:tomcat8 /opt/apache-tomcat-8.5.100

cd /opt/apache-tomcat-8.5.100/bin
./startup.sh

apt install net-tools -y

netstat -lntp


sudo vi /etc/systemd/system/tomcat.service

[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking
User=tomcat8
Group=tomcat8
Environment=CATALINA_PID=/opt/apache-tomcat-8.5.100/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/apache-tomcat-8.5.100
Environment=CATALINA_BASE=/opt/apache-tomcat-8.5.100
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
ExecStart=/opt/apache-tomcat-8.5.100/bin/startup.sh
ExecStop=/opt/apache-tomcat-8.5.100/bin/shutdown.sh

[Install]
WantedBy=multi-user.target


sudo systemctl daemon-reload

sudo systemctl start tomcat

sudo systemctl enable tomcat

sudo systemctl status tomcat

chown -R tomcat8:tomcat8 /opt/apache-tomcat-8.5.100/

sudo systemctl restart tomcat

cd /opt/apache-tomcat-8.5.100/webapps

cp /root/APP-STACK/student-proj-2/CustomWebApp/crud-app/target/CustomWebApp.war /opt/apache-tomcat-8.5.100/webapps/

sudo systemctl restart tomcat

--------------------------------------------

vi /etc/mysql/mysql.conf.d/mysqld.cnf

require_secure_transport = OFF

Driver
cd /opt/apache-tomcat-8.5.100/lib
wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.30/mysql-connector-java-8.0.30.jar

chown -R tomcat8:tomcat8 mysql-connector-java-8.0.30.jar

cd /opt/apache-tomcat-8.5.100/webapps

copy the war/jar file

cd /opt/apache-tomcat-8.5.100/conf

vim context.xml

<Resource name="jdbc/TestDB" auth="Container" type="javax.sql.DataSource"
               maxActive="50" maxIdle="30" maxWait="10000"
               username="student" password="student@1"
               driverClassName="com.mysql.cj.jdbc.Driver"
               url="jdbc:mysql://10.0.0.4:3306/test?useSSL=false&amp;allowPublicKeyRetrieval=true"/>

sudo systemctl restart tomcat

----------------------------------------------------
Web UI uses - Students table name
API uses - students table name







    


