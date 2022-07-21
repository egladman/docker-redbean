# [redbean](https://redbean.dev/)

A tiny ~300KB statically linked web server with robust architecture support.

## Quickstart

### [ghcr.io](https://github.com/egladman/docker-redbean/pkgs/container/redbean)
```
docker pull ghcr.io/egladman/redbean:latest
```

### [docker.io](https://hub.docker.com/r/egladman/redbean)
```
docker pull docker.io/egladman/redbean:latest
```

## Example

Publish container port `80` to host port `9000`

```
docker run --rm --publish 9000:80 egladman/redbean:latest
```

Open a web browser and navigate to [localhost:9000](localhost:9000).


## Build

```
make image
```

## Acknowledgement

Someone much smarter than me wrote the software, it just packaged it.

- [jart/cosmopolitan](https://github.com/jart/cosmopolitan)
