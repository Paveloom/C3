#!/bin/bash

# Вывод названия скрипта
print "\nЗапущен скрипт установки gmake.\n\n"

# Установка gmake

printf "\nВыполняется установка gmake.\n\n"
sudo port install gmake

# Проверка, установлен ли gmake

printf "\nВыполняется вывод версии gmake.\n\n"
gmake -v
