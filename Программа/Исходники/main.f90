program main ! Программа, демонстрирующая использование модуля
             ! для спектрально-корреляционного анализа временных рядов
use SCATS ! API модуля СКАВР
implicit none

     ! Определение экземпляра для использования API модуля СКАВР
     type( SCATS_API ) :: s

     ! Считывание параметров для генерации временного ряда
     call s%gen%params%read("Файлы/gen_params")

     ! Генерация входных данных (во внутренний объект)
     call s%generate()

     ! Запись временного ряда в файл
     call s%input%write('Файлы/input')

     ! Визуализация входных данных
     call s%visualize%input('Файлы/input')

     ! Удаление линейного тренда
     call s%rem_trend(type='l')

     ! Вычисление периодограммы
     call s%calc_per()

     ! Вычисление коррелограммы
     call s%calc_corr()

     ! Вычисление взвешенной коррелограммы
     call s%calc_w_corr(0.1_RP, 0.25_RP)

     ! Вычисление сглаженной периодограммы
     call s%calc_w_per()

     ! Запись результата в файл
     call s%result%write('Файлы/result')

     ! Визуализация временного ряда после извлечения тренда
     call s%visualize%result('Файлы/result', stage='data',&
                            & output_file="Фигуры/no_trend", title="После извлечения тренда")

     ! Визуализация периодограммы
     call s%visualize%result('Файлы/result', stage='per')

     ! Визуализация коррелограммы
     call s%visualize%result('Файлы/result', stage='corr')

     ! Визуализация сглаженной периодограммы
     call s%visualize%result('Файлы/result', stage='w_per')

     ! Общее освобождение памяти
     call s%deallocate()

end program main