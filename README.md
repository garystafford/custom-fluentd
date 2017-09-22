# Custom Fluentd Docker Image

Custom build of `fluent/fluentd` for article and demo on Docker logging to ELK on AWS.

Used to build a custom Fluentd image with additional Fluentd plugins, including the Elasticsearch `fluent-plugin-elasticsearch` plugin. Follows instructions provided with the `fluent/fluentd` image on [Docker Hub](https://hub.docker.com/r/fluent/fluentd/).

## Build New Image

```bash
mkdir custom-fluentd
cd custom-fluentd
curl https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/v0.14/alpine-onbuild/fluent.conf > fluent.conf
curl https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/Dockerfile.sample > Dockerfile
mkdir plugins
```

Modify the `Dockerfile` and `fluent.conf` as required.

`fluent.conf`
```text
# fluentd config for logging demo

<source>
  @type forward
  port 24224
</source>

<filter **>
  @type concat
  key log
  stream_identity_key container_id
  multiline_start_regexp /^\S+/
  multiline_end_regexp /\s+.*more$/
  flush_interval 120s
  timeout_label @processdata
</filter>

<filter **>
  @type record_transformer
  enable_ruby true
  remove_keys log
  <record>
    message ${record['log']}
  </record>
</filter>

<label @ERROR>
  <match **>
    @type stdout
  </match>
</label>

<label @processdata>
  <match **>
    @type stdout
  </match>
</label>

<match **>
  @type elasticsearch
  logstash_format true
  host elk
  port 9200
  index_name fluentd
  type_name fluentd
</match>
```
