# typesafety-docker

Dockerfile for development with HHVM/Hack

## Environments

* [HHVM](http://hhvm.com/)
* [composer](https://getcomposer.org/)
* [typesafety](https://github.com/hhpack/typesafety-cli)

## Basic uasge

If you want to check the type, execute the following command.  
The check result is output in detailed report formatted by [typesafety](https://github.com/hhpack/typesafety-cli).

The necessary files are in the **examples directory**.

```shell
docker-compose run web typesafety
```

If you want to run the test, you can execute it with the following command.

```shell
docker-compose run web vendor/bin/hackunit test
```

If the command is set in scripts of composer.json, you can do with the following command.

```shell
docker-compose run web composer test
```

## CI servise

### travis-ci

Please specify the access token to submit the check result as a review comment.

The sample file is in **examples/.travis.yml**.

```yaml
env:
  matrix:
    secure: [GITHUB_TOKEN]
```
