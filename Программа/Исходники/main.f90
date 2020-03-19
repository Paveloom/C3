program main ! Программа, демонстрирующая использование модуля
             ! для спектрально-корреляционного анализа временных рядов
use SCATS, only: SCATS_API ! API модуля СКАВР
implicit none
     
     type( SCATS_API ) :: s ! Определение экземпляра для использования API модуля СКАВР

     call s%gen%params%read("Файлы/gen_params") ! Считывание параметров для 
                                          ! генерации временного ряда

     call s%generate() ! Генерация входных данных (во внутренний объект)

     call s%input%write('Файлы/input') ! Запись временного ряда в файл

     call s%visualize%input('Файлы/input') ! Визуализация входных данных

     call s%remove_linear_trend() ! Удаление линейного тренда

     call s%result%write('Файлы/no_trend') ! Запись временного ряда в файл

     call s%deallocate() ! Общее освобождение памяти

end program main