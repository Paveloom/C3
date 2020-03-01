program main ! Программа, демонстрирующая использование модуля
             ! для спектрально-корреляционного анализа временных рядов
use scats, only: scats_api ! API модуля для СКАВР
implicit none
     
     type( scats_api ) s ! Определение экземпляра для использования API

     call s%gen%read("gen_params") ! Считывание параметров для генерации временного ряда
     
end program main