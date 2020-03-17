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

- ~~**databucket/all-in-one:2.2.5-alpine** alpine based image with mysql~~
- ~~**databucket/all-in-one:2.2.5-slim** debian slim based image with mysql~~
- **databucket/app:2.2.5-alpine** alpine based image
- **databucket/app:2.2.5-slim** debian slim based image

Crossed images are being prepared, stay tuned.

Image tags without platform suffix:

- ~~**databucket:all-in-one:latest** alpine based image with mysql~~
- ~~**databucket:all-in-one:2.2.5** alpine based image with mysql~~
- **databucket/app:latest** alpine based image
- **databucket/app:2.2.5** alpine based image

# Running the images

## all-in-one images

All-in-one images contain mysql instance, to let you setup instance of databucket app without excessive configuration.

```bash
docker run -d -p 8080:8080 databucket/all-in-one:2.2.5
```

## app only images

App only images require providing information about mysql instance where app should store it's data.  
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

## docker-compose

If you'd like to create your databucket docker environment, but don't want to setup mysql on your own, use provided sample [docker-compose.yaml](./databucket-docker-compose/docker-compose.yaml).

```bash
docker-compose -p databucket -f ./docker-compose.yaml up -d
```

Above command will create docker environment with two containers `databucket-app` and `databucket-mysql`.

`databucket-app` will expose port 8080, so app can be reached under `localhost:8080`.

# Building images locally

Databucket app is not currently available for download, this means, you have to build jar file on your own before building docker image.  
Once image is build, must be placed in respective folder (ie: in `databucket-docker-alpine`).  
Once jar file is in folder run one of below commands from repository root.

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

# Building images in TravisCI

Not yet available, requires **databucket-app** jar to be published somewhere first...
