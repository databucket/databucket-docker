exec java \
    -Ddatabuket.title=${TITLE} \
    -Dspring.datasource.url=jdbc:mysql://${DB_HOST}:${DB_PORT}/${DB_DATABASE}${DB_PROPERTIES} \
    -Dspring.datasource.username=${DB_USER} \
    -Dspring.datasource.password=${DB_PASSWORD} \
    -jar $1