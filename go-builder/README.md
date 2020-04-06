# go-builder

This builder image adds `make` utility on top of `golang:1.14.1-alpine3.11`

## Build and Publish

```bash
# Collect image version and docker credentials
# Publish image to registry.cn-hangzhou.aliyuncs.com under absurdlab/go-builder
chmox +x build.sh
./build.sh
```