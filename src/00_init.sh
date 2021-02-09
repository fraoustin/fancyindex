#!/bin/bash
if [ "$DISABLE_AUTH" == true ]; then
    sed -i '/auth_basic/s/^/#/' /etc/nginx/conf.d/default.conf
elif [ ! -z "$WEBUSER" ]; then
    addauth $WEBUSER $WEBPASSWORD
fi
