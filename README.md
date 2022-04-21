
This is a modified fork of [theasp/novnc](https://github.com/theasp/docker-novnc).

This container uses tigervnc and openbox.

```bash
docker build -t novnc .
docker run --security-opt seccomp=unconfined --name novnc --rm -it -p 9084:8080 novnc
```

Then visit http://localhost:9084/
