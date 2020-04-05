<pre>
    _____        _        _                _        _      ___  
   |  __ \      | |      | |              | |      | |    |__ \  
   | |  | | __ _| |_ __ _| |__  _   _  ___| | _____| |_      ) |  
   | |  | |/ _` | __/ _` | '_ \| | | |/ __| |/ / _ \ __|    / /  
   | |__| | (_| | || (_| | |_) | |_| | (__|   <  __/ |_    / /_  
   |_____/ \__,_|\__\__,_|_.__/ \__,_|\___|_|\_\___|\__|  |____|  
</pre>

# Docker images for Databucket 2

Images are available in [Dockerhub](https://hub.docker.com/u/databucket).

Images included:

- **databucket/app:2.2.5-alpine** alpine based image
- **databucket/app:2.2.5-slim** debian slim based image

Image tags without platform suffix:

- **databucket/app:latest** alpine based image
- **databucket/app:2.2.5** alpine based image

# Running the images

Images require providing information about mysql instance where app should store it's data.  
Environment variables to be used:

|variable|description|default value|
|-|-|-|
|DB_HOST|database host url|`localhost`|
|DB_PORT|database port|`3306`|
|DB_NAME|database name|`databucket`|
|DB_USER|database username|`databucket`|
|DB_PASSWORD|database user password|`data1234!`|

Database user must have the following privileges:

```sql
ALTER, CREATE, DELETE, DROP, EVENT, EXECUTE, INSERT, REFERENCES, SELECT, TRIGGER, UPDATE.
```

Database should be set to NOT require binary logging.  
To disable it run below command.

```sql
SET GLOBAL log_bin_trust_function_creators = 1;
```

For more details see [MySQL documentation](https://dev.mysql.com/doc/refman/8.0/en/stored-programs-logging.html).

## docker-compose

If you'd like to create your databucket docker environment, but don't want to setup mysql on your own, use provided sample [docker-compose.yaml](./databucket-docker-compose/docker-compose.yaml) with
[my.cnf](./databucket-docker-compose/my.cnf) configuration file.

```bash
docker-compose -p databucket -f ./docker-compose.yaml up -d
```

Above command will create docker environment with two containers `databucket-app` and `databucket-mysql`.

`databucket-app` will expose port 8080, so app can be reached under `localhost:8080`.

# Building images locally

Run one of below commands from repository root.

## Linux/OS X

|command|scope|
|-|-|
|`make all`|builds `alpine` and `slim` images|
|`make slim`|builds `slim` image|
|`make alpine`|builds `alpine` image|
|`make tag_latest`| re-tags `alpine` and `slim` images with `latest` version instead of current (ie. `2.2.5-alpine`)|
|`make tag_version`|re-tags `alpine` image with version only tag (ie. `2.2.5`)|
|`make release`|pushes `alpine` and `slim` images to docker-hub (requires respective credentials)|
|`make release_latest`|pushes latest images to docker-hub (requires respective credentials)|
|`make release_version`|pushes versioned images to docker-hub (requires respective credentials)|

## Windows

```bash
docker build -t databucket-app:2.2.5-alpine databucket-docker-alpine
```

or

```bash
docker build -t databucket-app:2.2.5-slim databucket-docker-slim
```

# Building images in TravisCI

Comming soon.
