#!/bin/bash

# Скачивание пакета MacPorts 2.6 для macOS 10.15 Catalina

printf "\n Выполняется скачивание пакета.\n\n"
curl -O https://github.com/macports/macports-base/releases/download/v2.6.2/MacPorts-2.6.2-10.15-Catalina.pkg

# Получение полного пути к файлу

printf "\n Выполняется получение полного пути к файлу.\n\n"


TARGET_FILE="MacPorts-2.6.2-10.15-Catalina.pkg"

cd `dirname $TARGET_FILE`
TARGET_FILE=`basename $TARGET_FILE`

# Iterate down a (possible) chain of symlinks
while [ -L "$TARGET_FILE" ]
do
    TARGET_FILE=`readlink $TARGET_FILE`
    cd `dirname $TARGET_FILE`
    TARGET_FILE=`basename $TARGET_FILE`
done

# Compute the canonicalized name by finding the physical path 
# for the directory we're in and appending the target file.
PHYS_DIR=`pwd -P`
RESULT=$PHYS_DIR/$TARGET_FILE
echo $RESULT

# Установка пакета

printf "\n Выполняется установка пакета."
sudo installer -pkg MacPorts-2.6.2-10.15-Catalina.pkg -target /

