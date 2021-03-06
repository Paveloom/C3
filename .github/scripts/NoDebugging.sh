#!/bin/bash

# Вывод названия скрипта
printf "\nЗапущен скрипт, проверяющий, активен ли флаг отладки\n\n"

# Определение начального числа ошибок
ERROR_COUNT=0

# Описание функции для проверки make-файлов
function check_debugging {

   printf "Проверяется make-файл $1 ...\n\n"

   if grep "debugging := " "$1" | grep -q "true"; then

      printf "[!] Флаг отладки активирован в этом make-файле.\n\n"
      ERROR_COUNT=$((ERROR_COUNT+1))

   else

      printf "Флаг отладки НЕ активирован в этом make-файле.\n\n"

   fi

}

# Определение функции проверок
function run_debugging_checks {

   check_debugging "Программа/Makefile"
   check_debugging "Программа/Make-файлы/gfortran-9"
   check_debugging "Программа/Make-файлы/gmake"

   check_debugging "Упражнение/Программа/Makefile"

}

# Проверка make-файлов
run_debugging_checks

# Проверка числа ошибок
if [ "$ERROR_COUNT" -gt 0 ]; then

     printf "Число ошибок: $ERROR_COUNT\n\n"
     exit 1

else

     printf "\nВсё в порядке.\n"

fi