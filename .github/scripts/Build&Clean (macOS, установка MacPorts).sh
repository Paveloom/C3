#!/bin/bash

# Вывод названия скрипта
print "\nЗапущен скрипт установки MacPorts.\n\n"

# Скачивание пакета MacPorts 2.6 для macOS 10.15 Catalina

printf "\nВыполняется скачивание пакета.\n\n"
curl -JOL 'https://github.com/macports/macports-base/releases/download/v2.6.2/MacPorts-2.6.2-10.15-Catalina.pkg'

# Получение полного пути к файлу

printf "\nВыполняется получение полного пути к файлу.\n\n"

## Источник скрипта: https://stackoverflow.com/questions/1055671/how-can-i-get-the-behavior-of-gnus-readlink-f-on-a-mac

TARGET_FILE="MacPorts-2.6.2-10.15-Catalina.pkg"

cd `dirname $TARGET_FILE`
TARGET_FILE=`basename $TARGET_FILE`

## Продолжать итерацию по (возможной) цепочке символьных ссылок

while [ -L "$TARGET_FILE" ]
do
    TARGET_FILE=`readlink $TARGET_FILE`
    cd `dirname $TARGET_FILE`
    TARGET_FILE=`basename $TARGET_FILE`
done

## Получение абсолютного пути целевого файла с помощью нахождения физического 
## пути той директории, в которой мы находимся, и присоединения к нему
## имени целевого файла.

PHYS_DIR=`pwd -P`
RESULT=$PHYS_DIR/$TARGET_FILE

printf "Полный путь к целевому файлу:\n"
printf $RESULT

# Установка пакета

printf "\n\nВыполняется установка пакета.\n\n"
sudo installer -verbose -pkg $RESULT -target /

# Обновление переменной PATH
export PATH=$PATH:/opt/local/bin

# Установка gmake

printf "\nВыполняется установка gmake.\n\n"
sudo port install gmake

# Проверка, установлен ли gmake

printf "\nВыполняется вывод версии gmake.\n\n"
gmake -v