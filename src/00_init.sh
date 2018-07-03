#!/bin/bash

if [ ! -z "$WEBUSER" ]; then
    addauth $WEBUSER $WEBPASSWORD
fi    
