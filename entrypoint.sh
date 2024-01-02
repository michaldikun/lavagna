#!/bin/sh 
#connecting to the db 
echo "Waiting for MySQL to start..."

while ! nc -z localhost 3306; do   
  sleep 5 # Wait for 5 second before trying again
done

echo "MySQL started successfully!"

java -jar your-java-app.jar

java -Xms64m -Xmx128m -Ddatasource.dialect="${DB_DIALECT}" \
-Ddatasource.url="${DB_URL}" \
-Ddatasource.username="${DB_USER}" \
-Ddatasource.password="${DB_PASS}" \
-Dspring.profiles.active="${SPRING_PROFILE}" \
-jar ./target/lavagna-jetty-console.war --headless
