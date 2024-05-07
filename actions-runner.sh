#!/bin/bash
echo "  __  __ _                _                   "
echo " |  \/  (_)              | |                  "
echo " | \  / |_  ___ ___  _ __| | _____  ___ _ __  "
echo " | |\/| | |/ __/ _ \| '__| |/ / __|/ _ \ '_ \ "
echo " | |  | | | (_| (_) | |  |   <\__ \  __/ | | |"
echo " |_|  |_|_|\___\___/|_|  |_|\_\___/\___|_| |_|"
echo "                                              "
echo "                                              "

VERSION=$(curl -s https://api.github.com/repos/actions/runner/releases/latest | awk -F '"' '/tag_name/{split($4, a, "v"); print a[2]}')
INSTALL_DIR="/usr/local/actions-runner/"
ARCH="unsupported"

case $(uname -m) in
  x86_64)
    ARCH="x64"
    ;;
  armv7l)
    ARCH="arm"
    ;;
  armv8l|aarch64)
    ARCH="arm64"
    ;;
esac

if [[ $ARCH == "unsupported" ]]; then
  echo "Sorry, Actions Runner is not supported for architecture $ARCH."
  echo "It is supported for x64, ARM32 or ARM64."
  exit 1
fi

echo "Actions Runner is now installing..."
mkdir -p $INSTALL_DIR
cd $INSTALL_DIR

curl -o actions-runner-linux.tar.gz -L https://github.com/actions/runner/releases/download/v$VERSION/actions-runner-linux-$ARCH-$VERSION.tar.gz
tar xzf actions-runner-linux.tar.gz
rm actions-runner-linux.tar.gz

./svc.sh install
if [ $? -eq 0 ]; then
  echo "The service has been successfully installed!"
else
  echo "An error has occurred when trying to install the service."
fi

echo "Actions Runner v$VERSION is now installed without any configuration."
