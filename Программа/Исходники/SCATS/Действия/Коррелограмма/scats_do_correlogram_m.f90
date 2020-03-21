module scats_do_correlogram_m
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & SP, & ! Точность целого числа статусной переменной
                 & JP, & ! Точность целого числа счетчика и индекса
                 & LP    ! Число байт для хранения логической переменной
use scats_result_m, only : result_type ! Тип, определяющий входные данные
use scats_do_errors_m, only : scats_log_do_error ! Процедура для вывода ошибок
use scats_do_fft_m, only : scats_do_fft_calculate ! Процедура для выполнения быстрого преобразования Фурье
implicit none
     
     private
     public :: scats_do_correlogram_calculate ! Процедура для вычисления коррелограммы
     
     interface
     
          module subroutine scats_do_correlogram_calculate(result)
          implicit none
          
               type( result_type ) :: result ! Результат
          
          end subroutine scats_do_correlogram_calculate
     
     end interface
     
end module scats_do_correlogram_m