# Docker image with Kafka CLI

[![Docker Pulls](https://img.shields.io/docker/pulls/arcaneio/kafka-cli.svg?style=flat)](https://hub.docker.com/r/arcaneio/kafka-cli/)
[![Docker Automated build](https://img.shields.io/docker/automated/arcaneio/kafka-cli.svg?style=flat)](https://hub.docker.com/r/arcaneio/kafka-cli/)
[![Docker Build Status](https://img.shields.io/docker/build/arcaneio/kafka-cli.svg?style=flat)](https://hub.docker.com/r/arcaneio/kafka-cli/)
[![license](https://img.shields.io/github/license/arcane-io/docker-kafka-cli.svg)](https://github.com/arcane-io/docker-kafka-cli)

Alpine based docker image with some useful tools and Kafka CLI based on <https://github.com/infinimesh/kaf>

## Usage examples

Example ~/.kaf/config

```yaml
current-cluster: "my-kafka-cluster"
clusters:
- name: my-kafka-cluster
  brokers:
  - kafka-broker-1:9092
  - kafka-broker-2:9092
  - kafka-broker-3:9092
  SASL: null
  security-protocol: ""
```

Run in kubernetes

```bash
kubectl run kafka-cli -it --image=arcaneio/kafka-cli --restart=Never bash
```
