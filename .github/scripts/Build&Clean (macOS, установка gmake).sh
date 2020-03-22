#!/bin/bash

# Вывод названия скрипта
printf "\nЗапущен скрипт установки gmake.\n\n"

# Обновление переменной PATH
export PATH=$PATH:/opt/local/bin

# Установка gmake

printf "Выполняется установка gmake.\n\n"
sudo port install gmake

# Проверка, установлен ли gmake

printf "\nВыполняется вывод версии gmake.\n\n"
gmake -v
