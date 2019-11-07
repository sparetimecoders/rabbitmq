# rabbitmq

[RabbitMQ](https://www.rabbitmq.com/) with delayed messaging plugin installed.
Based on the official [docker image](https://hub.docker.com/_/rabbitmq).

# Example usage

## Docker

````bash

$ docker run -d \
  -e RABBITMQ_DEFAULT_USER=user \
  -e RABBITMQ_DEFAULT_PASS=password \
  -p 5672:5672 \
  -p 15672:15672 \ 
  sparetimecoders/rabbitmq
````

Now you can access it with `amqp://user:password@localhost:5672`, the admin UI is available on https://localhost:15672.

## Kubernetes

Use the Kubernetes descriptor files in the repository as a baseline. 

```bash
$ kubectl apply -f deployment.yaml
```
This will create a single instance of RabbitMQ running in your cluster. To expose it for local usage:

```bash
$ kubectl apply -f loadbalancer.yaml
```
This will expose the service as a [Loadbalancer](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types).
Now you can access it with `amqp://user:password@localhost:5672`, the admin UI is available on https://localhost:15672.
