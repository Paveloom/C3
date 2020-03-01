program main ! Программа, демонстрирующая использование модуля
             ! для спектрально-корреляционного анализа временных рядов
use SCATS, only: SCATS_API ! API модуля для СКАВР
implicit none
     
     type( SCATS_API ) s ! Определение экземпляра для использования API

     call s%gen%read("gen_params") ! Считывание параметров для генерации временного ряда
     
end program main