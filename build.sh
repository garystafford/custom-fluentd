#!/bin/sh

# disconect from Docker dameon
unset DOCKER_TLS_VERIFY DOCKER_CERT_PATH DOCKER_HOST

source ~/Documents/Notes/dockerhub_login.env
docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_PASSWORD}
docker build --no-cache -t garystafford/custom-fluentd:latest .
docker push garystafford/custom-fluentd:latest
