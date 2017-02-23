# Logrotate

Docker image allowing you to use logrotate as a docker command.

## Usage

```
docker run --rm -v $(pwd)/logrotate.conf:/logrotate.conf -v $(pwd)/logs:/var/log zeroboh/logrotate:3.9-alpine
```
