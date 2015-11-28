#!/bin/bash
set -x

FILES="vimrc.before.fork vimrc.before.local vimrc.bundles.local vimrc.local"


do_backup() {
  today=$(date +%Y%m%d_%s)

  [ -e "$1" ] && [ ! -L "$1" ] && mv -v "$1" "$1.${today}"
}

## Resolve local script dir
pushd $(dirname $0) > /dev/null
SCRIPT_PATH=$(pwd)
popd /dev/null

for f in ${FILES}; do
  do_backup ${HOME}/.${f}
  ln -sf ${SCRIPT_PATH}/${f} ${HOME}/.${f}
done

echo "vimrc installed correctly"
