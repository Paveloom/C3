module scats_do_periodogram_m ! Модуль, содержащий процедуры
                              ! для вычисления периодограммы
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & SP, & ! Точность целого числа статусной переменной
                 & JP, & ! Точность целого числа счетчика и индекса
                 & LP    ! Число байт для хранения логической переменной
use scats_result_m, only : result_type ! Тип, определяющий входные данные
use scats_do_errors_m, only : scats_log_do_error ! Процедура для вывода ошибок (действия)
use scats_do_fft_m, only : scats_do_fft_calculate ! Процедура для выполнения быстрого преобразования Фурье
implicit none

     private
     public :: scats_do_periodogram_calculate, & ! Процедура для вычисления периодограммы
             & scats_do_periodogram_calculate_w ! Процедура для вычисления сглаженной периодограммы

     interface

          ! Процедура для вычисления периодограммы
          module impure subroutine scats_do_periodogram_calculate(result)
          implicit none

               type( result_type ) :: result ! Результат

          end subroutine scats_do_periodogram_calculate

          ! Процедура для вычисления сглаженной периодограммы
          module impure subroutine scats_do_periodogram_calculate_w(result)
          implicit none

               type( result_type ) :: result ! Результат

          end subroutine scats_do_periodogram_calculate_w

     end interface

end module scats_do_periodogram_m