#!/bin/bash -eux

cwd=$(pwd)

pushd $cwd/dp-frontend-cache-helper
  make lint
popd
