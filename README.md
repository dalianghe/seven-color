# seven-color
cd /opt/deploys/java/cus/1/seven-color

service xg_cus_1 stop
git pull https://github.com/dalianghe/seven-color.git
mvn clean package -Dmaven.test.skip=true

service xg_cus_1 restart