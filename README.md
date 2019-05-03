# Docker Image for fancyindex

generate a nginx server with fancyindex

You can use client

- ihm on http://127.0.0.1/ (fraoustin/Nginx-Fancyindex-Theme)


load when start image load file in

- /usr/share/gitweb/docker-entrypoint.pre
- /usr/share/gitweb/docker-entrypoint.post

## Parameter

- SET_CONTAINER_TIMEZONE (false or true) manage time of container
- CONTAINER_TIMEZONE timezone of container
- DISABLE_AUTH (false or true) allows you to disable auth on nginx
- WEBUSER (default user)
- WEBPASSWORD (default pass)
- COLOR (default blue) for web ihm (blue, green, grey, greydark, orange, purple, red)

## Volume

- /share

## Port

- 80 

## Command

- addauth : add user for git
- rmauth : remove user

## Usage direct

run image fraoustin/webdav

    docker run -d -v <localpath>:/share --name fancyindex -p 80:80 fraoustin/fancyindex

user default is *user* and password default is *pass*

you use http://localhost/ for access ihm

## Usage by Dockerfile

Sample of Dockerfile

    FROM fraoustin/webdav
    COPY ./00_init.sh /usr/share/docker-entrypoint.pre/00_init.sh
    RUN chmod +x -R /usr/share/gitweb/docker-entrypoint.pre

File 00_init.sh

    #!/bin/bash
    if [ ! -z "$WEBUSER" ]; then
        addauth $WEBUSER $WEPASSWORD
    fi    


build image mywebdav

    docker build -t myfancyindex .

run image mywebdav

    docker run -d -e "CONTAINER_TIMEZONE=Europe/Paris" -e WEBUSER=myuser" -e "WEBPASSWORD=mypassword" -v <localpath>:/share --name test -p 8080:80 myfancyindex

## External library

- mdl on https://getmdl.io/
- Nginx-Fancyindex-Theme on https://github.com/fraoustin/Nginx-Fancyindex-Theme


