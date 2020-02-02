#!/bin/bash
set -eu

if [[ "${JUMPBOX_DEBUG:-}" = "yes" ]]; then
  set -x
fi

case ${1:-shell} in
shell)
  if [[ -n "${JUMPBOX_USER_USERNAME:-}" && \
        -n "${JUMPBOX_USER_UID:-}"      && \
        -n "${JUMPBOX_USER_GID:-}" ]]; then

    JUMPBOX_USER_HOME=${JUMPBOX_USER_HOME:-/home/$JUMPBOX_USER_USERNAME}
    if [[ ! -d ${JUMPBOX_USER_HOME} ]]; then
      mkdir ${JUMPBOX_USER_HOME}
    fi
    chown ${JUMPBOX_USER_UID}:${JUMPBOX_USER_GID} ${JUMPBOX_USER_HOME}

    groupadd -fog ${JUMPBOX_USER_GID} ${JUMPBOX_USER_USERNAME}
    useradd -Md ${JUMPBOX_USER_HOME} -o -u ${JUMPBOX_USER_UID} -g ${JUMPBOX_USER_GID} \
            -s ${JUMPBOX_USER_SHELL:-/bin/sh} ${JUMPBOX_USER_USERNAME}

    who=${JUMPBOX_USER_USERNAME}
    unset JUMPBOX_USER_USERNAME \
          JUMPBOX_USER_HOME \
          JUMPBOX_USER_SHELL \
          JUMPBOX_USER_UID \
          JUMPBOX_USER_GID

    exec su --preserve-environment - $who
    exit 1
  fi
  exec /bin/bash
  exit 1
  ;;

*)
  exec "$@"
  exit 1
  ;;
esac
