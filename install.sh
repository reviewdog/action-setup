#!/usr/bin/env bash

set -eu

VERSION="${REVIEWDOG_VERSION:-latest}"

TEMP="${REVIEWDOG_TEMPDIR}"
if [ -z "${TEMP}" ]; then
  if [ -n "${RUNNER_TEMP}" ]; then
    TEMP="${RUNNER_TEMP}"
  else
    TEMP="$(mktemp -d)"
  fi
fi

INSTALL_SCRIPT='https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh'
if [ "${VERSION}" = 'nightly' ]; then
  INSTALL_SCRIPT='https://raw.githubusercontent.com/reviewdog/nightly/master/install.sh'
  VERSION='latest'
fi

mkdir -p "${TEMP}/reviewdog/bin"

echo '::group::🐶 Installing reviewdog ... https://github.com/reviewdog/reviewdog'
(
  if command -v curl 2>&1 >/dev/null; then
    curl -sfL "${INSTALL_SCRIPT}"
  elif command -v wget 2>&1 >/dev/null; then
    wget -O - "${INSTALL_SCRIPT}"
  else
    echo "curl or wget is required" >&2
    exit 1
  fi
) | sh -s -- -b "${TEMP}/reviewdog/bin" "${VERSION}" 2>&1 || {
  echo "Failed to install reviewdog. Attempting to fetch the latest tag from GitHub."
  LATEST_TAG=$(curl -s https://api.github.com/repos/reviewdog/reviewdog/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
  if [ -z "${LATEST_TAG}" ]; then
    echo "Unable to find the latest tag on GitHub. Exiting."
    exit 1
  fi
  echo "Found latest tag: ${LATEST_TAG}. Retrying installation."
  curl -sfL "${INSTALL_SCRIPT}" | sh -s -- -b "${TEMP}/reviewdog/bin" "${LATEST_TAG}" 2>&1
}
echo '::endgroup::'

echo "${TEMP}/reviewdog/bin" >>"${GITHUB_PATH}"
