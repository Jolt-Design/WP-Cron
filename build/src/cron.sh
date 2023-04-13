#!/bin/sh

# TODO: Check if this command is already running

echo Running WP Cron...
echo WordPress Host: $WORDPRESS_HOST
exec wget -q -O - http://${WORDPRESS_HOST}/wp-cron.php?doing_wp_cron 2>&1
