#!/bin/sh

set -ex

LAUNCHER_VERSION=${VERSION:-"0.0.0"}
# VERSION cannot be a string in Advanced Installer. Let's use 0.0.0 for bleeding edge versions
if [[ $LAUNCHER_VERSION == "bleedingEdge" ]]; then
  LAUNCHER_VERSION="0.0.0"
fi 

# ADVINST=${ADVINST:-"C:\Program Files (x86)\Caphyon\Advanced Installer 14.7\bin\x86\advinst.exe"}
# Advanced installer bin directory must be added to the path to run this script
#   WARNING: The path MUST NOT be surrounded by double quotes else, the path with not be converted to
#            unix form and then executable will not be found!
ADVINST=advinst.exe
ADVINST_PROJECT=pharo-launcher.aip
ADVINST_COMMAND_FILE=pharo-launcher.aic

PHARO_WIN_DIR="Pharo-win\Pharo"
OUT_DIR=$(pwd)

# Advanced Installer working directory is the directory where the AIP file stands
cp icons/pharo-launcher.ico windows/
mkdir windows/Pharo-win
mv Pharo windows/Pharo-win/

cd windows
# $ADVINST /newproject $ADVINST_PROJECT -lang en -overwrite
# we MUST add an extra-slash on ADVINST command else single slash is omited
$ADVINST //execute "$ADVINST_PROJECT" "$ADVINST_COMMAND_FILE"
cd -

mv pharo-launcher.msi pharo-launcher-"$VERSION".msi