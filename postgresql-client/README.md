## postgresql-client

Minimal environment with PostgreSQL client:

* built on top of `alpine` base image
* ~6 MB in size (5 MB base + 1 MB)

### Example usage:

```bash
$ docker run -it --rm jbergknoff/postgresql-client postgresql://user:pass@host:5432/db
...
```
To override `psql` and call pg_dump instead:
```bash
$ docker run -v /path/for/backup:/var/pgdata -it --rm --entrypoint pg_dump \   
jbergknoff/postgresql-client -h host -U user -f /var/pg_data/mydump.sql db
...
```
