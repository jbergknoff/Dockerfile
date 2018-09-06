## postgresql-client

Minimal environment with PostgreSQL client:

* built on top of `alpine` base image
* ~6 MB in size (5 MB base + 1 MB)

### Example usage:

```bash
$ docker run -it --rm -e PGPASSWORD=s3cr3t jbergknoff/postgresql-client -h localhost -p 5432 -U user -d db
...
```
