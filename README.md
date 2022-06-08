## Heimdall-docker
Heimdall-docker is the Heimdall wrapped in docker container

[Docker Hub image](https://hub.docker.com/repository/docker/flacoshinobi/heimdall)

## Heimdall
Heimdall is a cross-platform open-source tool suite used to flash firmware (aka ROMs) onto Samsung mobile devices.

[Repository of Heimdall](https://github.com/Benjamin-Dobell/Heimdall)

## How to use

```sh
docker run --rm \
  --device /dev/bus/usb:/dev/bus/usb \
  -v $PWD:/fw \
  flacoshinobi/heimdall \
  <heimdall command>
```
