## mysql

Minimal environment with MySQL server:

* built on top of `alpine` base image
* ~88 MB in size (5 MB base + 83 MB)

### Security

I don't make any warranties about the security of this container. It's a toy for development purposes.

By default, no users or privileges are added or subtracted from the standard MySQL config. You can grant access by passing environment variables when the container is started.

* `ROOT_PASSWORD` grants password-based access to `root` from any host.
* `USERNAME` and `PASSWORD` (must be supplied together to take effect) creates a new user with password-based access from any host, and with full privileges on the entire database.

### Example usage:

```bash
$ docker run -d --name cool_mysql -e ROOT_PASSWORD=docker jbergknoff/mysql
$ docker run -it --rm --link cool_mysql:db jbergknoff/mysql-client sh
# mysql -h db -u root -p
Enter password: [docker]
Welcome to the MySQL monitor.  Commands end with ; or \g.
...
```
