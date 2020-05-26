#!/bin/bash

set -e

if ! command -v http-server; then
  echo "Please install this simple CLI http-server - https://www.npmjs.com/package/http-server"
  echo "npm install --global http-server"
  exit 1
fi

http-server -c-1 .
