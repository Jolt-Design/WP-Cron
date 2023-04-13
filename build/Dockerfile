FROM alpine

RUN apk add --no-cache tini
RUN mkdir -p /usr/local/bin/wp-cron/

# Copy script which should be run
COPY ./src/ /usr/local/bin/wp-cron/

# Make it executable
RUN chmod a+x /usr/local/bin/wp-cron/cron.sh

# Run the cron every minute
RUN echo '*  *  *  *  *    /usr/local/bin/wp-cron/cron.sh' > /etc/crontabs/root

# Default hostname to web
ENV WORDPRESS_HOST web

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["crond", "-l", "2", "-f"]
