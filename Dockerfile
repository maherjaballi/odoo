FROM debian:stretch-slim

#docker run -d -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo -e POSTGRES_DB=postgres --name db postgres:10

# Required for starting application up.
RUN apk update && apk add /bin/bash

# Copy entrypoint script and Odoo configuration file
COPY ./entrypoint.sh /
COPY ./odoo.conf /etc/odoo/

# Mount /var/lib/odoo to allow restoring filestore and /extra-addons for users addons
RUN chown odoo /etc/odoo/odoo.conf \
    && mkdir -p /extra-addons \
    && chown -R odoo /extra-addons
VOLUME ["/var/lib/odoo", "/extra-addons"]




