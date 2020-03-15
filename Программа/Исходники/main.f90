program main ! Программа, демонстрирующая использование модуля
             ! для спектрально-корреляционного анализа временных рядов
use SCATS, only: SCATS_API ! API модуля СКАВР
implicit none
     
     type( SCATS_API ) :: s ! Определение экземпляра для использования API модуля СКАВР

     call s%gen%params%read("gen_params") ! Считывание параметров для 
                                          ! генерации временного ряда

     call s%generate() ! Генерация входных данных (во внутренний объект)

     call s%input%write_to_file('input') ! Запись временного ряда в файл

     call s%deallocate() ! Общее освобождение памяти

end program main