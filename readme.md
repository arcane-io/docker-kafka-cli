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

### Run in kubernetes

#### Deploy with kubectl

```bash
kubectl run kafka-cli -it --image=arcaneio/kafka-cli --restart=Never bash
```

At the bash prompt type `kaf` for usage examples.

#### Or by using a yaml file

1. create a yaml file ( eg. `kafka-cli.yaml` ) as in the example bellow

    > NOTE: the `KAF_CONFIG` value contains a base64 encoded of the above config file

    ```yaml
    apiVersion: v1
    kind: Pod
    metadata:
    name: kafka-cli
    spec:
    containers:
    - name: kafka-cli
        args: ["echo $KAF_CONFIG | base64 -d > ~/.kaf/config && while true; do sleep 10000; done"]
        env:
        - name: KAF_CONFIG
        value: Y3VycmVudC1jbHVzdGVyOiAibXkta2Fma2EtY2x1c3RlciIKY2x1c3RlcnM6Ci0gbmFtZTogbXkta2Fma2EtY2x1c3RlcgogIGJyb2tlcnM6CiAgLSBrYWZrYS1icm9rZXItMTo5MDkyCiAgLSBrYWZrYS1icm9rZXItMjo5MDkyCiAgLSBrYWZrYS1icm9rZXItMzo5MDkyCiAgU0FTTDogbnVsbAogIHNlY3VyaXR5LXByb3RvY29sOiAiIg==
        image: arcaneio/kafka-cli
        imagePullPolicy: Always
        resources:
        requests:
            cpu: "200m"
            memory: "200Mi"
        limits:
            cpu: "500m"
            memory: "800Mi"
    dnsPolicy: ClusterFirst
    restartPolicy: Never
    ```

2. deploy the pod

    ```bash
    kubectl apply -f kafka-cli.yml
    ```

3. connect to your pod

    ```bash
    kubectl exec -it kafka-cli bash
    ```