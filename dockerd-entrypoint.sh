#!/bin/sh
set -e

exec "dockerd -s overlay2"
