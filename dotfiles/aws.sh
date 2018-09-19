#!/bin/sh
exec aws-vault exec "${AWS_PROFILE:-default}" -- /usr/local/bin/aws "$@"
