# Custom Fluentd Docker Image

Custom build of `fluent/fluentd` for article and demo on Docker logging to ELK on AWS.

Used to build a custom Fluentd image with additional Fluentd plugins, including the Elasticsearch plugin. Follows instructions provided with the `fluent/fluentd` image on [Docker Hub](https://hub.docker.com/r/fluent/fluentd/).

## Build New Image

```bash
mkdir custom-fluentd
cd custom-fluentd
curl https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/v0.14/alpine-onbuild/fluent.conf > fluent.conf
curl https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/Dockerfile.sample > Dockerfile
mkdir plugins
```

Modify the `Dockerfile` and `fluent.conf` as required.
