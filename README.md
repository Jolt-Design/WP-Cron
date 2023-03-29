# Jolt Docker WP Cron

Source repository for the [joltdesign/wp-cron](repo) image.

A Docker container that runs wp-cron.php every minute in order to simulate the live environment we use, where cron is either run by an external Lambda or by `cron` on a VPS.

This is intended to be paired with `define('DISABLE_WP_CRON', true);` in `wp-config.php`.

## Usage

Add the following to your docker-compose.yml and replace "wordpress" with the name of your WordPress service if necessary.

```yml
services:
  # ...
  wp_cron:
    image: joltdesign/wp-cron
    environment:
      WORDPRESS_HOST: wordpress
    depends_on:
      - wordpress
  # ...
```

The `depends_on` section prevents cron from trying to run before the container is available.

## Building

Run `yarn install` the first time you clone the repo.

To build a new version of this image, make your changes in `build/src` then run `yarn deploy`. Your Docker Hub account must be added as a collaborator on the [Docker Hub repo](repo) to be able to deploy the changes.

[repo]: https://hub.docker.com/r/joltdesign/wp-cron
