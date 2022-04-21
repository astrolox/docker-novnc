#!/bin/bash
set -ex

RUN_OPENBOX=${RUN_OPENBOX:-yes}
RUN_XTERM=${RUN_XTERM:-yes}

case $RUN_OPENBOX in
  false|no|n|0)
    rm -f /app/conf.d/openbox.conf
    ;;
esac

case $RUN_XTERM in
  false|no|n|0)
    rm -f /app/conf.d/xterm.conf
    ;;
esac

exec supervisord -c /app/supervisord.conf
