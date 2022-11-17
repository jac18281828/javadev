# javadev

Java Development Container for Docker and VS Code

### Architecture
* linux/amd64 
* linux/arm64

Example Dockerfile - for use as builder

```
ARG VERSION=latest
FROM jac18281828/javadev:${VERSION} as builder
```

Also available from [GitHub GHCR](https://github.com/jac18281828/javadev/pkgs/container/javadev)
