#!/bin/sh
BINST_VERSION="v0.7.6"
./scripts/binst.sh "${BINST_VERSION}" -- gen --config .config/binstaller/reviewdog.yml -o install-reviewdog.sh
./scripts/binst.sh "${BINST_VERSION}" -- gen --config .config/binstaller/reviewdog-nightly.yml -o install-nightly.sh
