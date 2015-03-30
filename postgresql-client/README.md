## postgresql-client

Minimal environment with PostgreSQL client:

* built on top of `alpine` base image
* ~6 MB in size (5 MB base + 1 MB)

### Example usage:

```bash
$ docker run -it --rm jbergknoff/postgresql-client psql://user:pass@host:5432/db
...
```
