#!/bin/bash

# Вывод названия скрипта
printf "\nЗапущен скрипт для проверки сборки и очистки программы.\n"

# Определение функции для проверки команд
function check_if_succeeded {

    # Вывод информации о запущенной программе
    printf "\nПроверяется команда $@.\n\n"

    # Выполнение указанной команды
    $@

    local status=$?

    if [ $status -ne 0 ]; then
        printf "\n[!] Ошибка при выполнении команды $1.\n\n"
        exit 1
    fi

    return $status

}

# Переход в директорию с программой
cd Программа/

# Смена текущего make-файла на make-файл для gfortran-9
mv -f Make-файлы/gfortran-9 Makefile

# Проверка на удачную сборку
check_if_succeeded "make"

# Выполнение очистки

printf "\nВыполняется очистка директории с объектными файлами.\n\n"
make clean

# Проверка, пуста ли папка с объектными файлами

printf "Проверяется, пуста ли директории с объектными файлами.\n\n"

if [ -z "$(ls Объектники/)" ]; then
   printf "Директория пуста, все в порядке.\n"
else
   printf "[!] Директория с объектными файлами не пуста.\n\n"
   exit 1
fi
