program main ! Программа, демонстрирующая использование модуля
             ! для спектрально-корреляционного анализа временных рядов
use SCATS, only: SCATS_API ! API модуля СКАВР
implicit none
     
     type( SCATS_API ) :: s ! Определение экземпляра для использования API модуля СКАВР

     call s%gen%params%settings%read("gen_settings") ! Считывание настроек считывания параметров 
                                                     ! для генерации временного ряда

     call s%gen%params%read("gen_params") ! Считывание параметров для 
                                          ! генерации временного ряда

     call s%gen%params%deallocate() ! Освобождение памяти из-под параметров
     
end program main