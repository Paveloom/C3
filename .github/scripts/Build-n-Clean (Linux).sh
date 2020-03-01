#!/bin/bash

# Определение функции для проверки команд

function check_if_succeeded {

    "$@"

    local status=$?

    if [ $status -ne 0 ]; then
        printf "\nОшибка при выполнении команды $1\n\n"
        exit 1
    fi

    return $status

}

# Переход в директорию с программой
cd Программа/

# Проверка на удачную сборку
check_if_succeeded "make"

# Проверка на удачную очистку
check_if_succeeded "clean"