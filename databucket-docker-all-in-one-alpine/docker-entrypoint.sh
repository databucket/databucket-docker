exec java \
    -Dspring.datasource.url=jdbc:mysql://${DB_HOST}:${DB_PORT}/${DB_DATABASE} \
    -Dspring.datasource.username=${DB_USER} \
    -Dspring.datasource.password=${DB_PASSWORD} \
    -jar $1