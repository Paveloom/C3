#!/bin/bash

# Вывод названия скрипта
printf "\nЗапущен скрипт для установки зависимостей.\n"

# Установка модуля matplotlib
printf "Выполняется установка модуля matplotlib.\n"
pip3 install matplotlib

# Установка дополнительных шрифтов из пакета texlive
printf "\nВыполняется установка дополнительных шрифтов из пакета texlive.\n"
sudo apt-get install texlive-fonts-extra

# Установка пакета dvipng
printf "\nВыполняется установка дополнительных шрифтов из пакета texlive.\n"
        sudo apt-get install dvipng
        sudo apt-get install cm-super
        sudo apt-get install texlive-lang-cyrillic
