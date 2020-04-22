module scats_do_periodogram_m ! Модуль, содержащий процедуры
                              ! для вычисления периодограммы
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & SP, & ! Точность целого числа статусной переменной
                 & JP, & ! Точность целого числа счетчика и индекса
                 & LP    ! Число байт для хранения логической переменной
use scats_input_m, only : input_type ! Тип, определяющий входные данные
use scats_result_m, only : result_type ! Тип, определяющий результат
use scats_do_check_m, only : scats_do_check ! Процедура для проверки на совпадение форм входных данных и результата
use scats_do_errors_m, only : scats_do_errors_log_error ! Процедура для вывода ошибок (действия)
use scats_do_fft_m, only : scats_do_fft_calculate ! Процедура для выполнения быстрого преобразования Фурье
implicit none

     private
     public :: scats_do_periodogram_calculate, & ! Процедура для вычисления периодограммы
             & scats_do_periodogram_calculate_w  ! Процедура для вычисления сглаженной периодограммы

     interface

          ! Процедура для вычисления периодограммы
          module impure subroutine scats_do_periodogram_calculate(result, call_stat, input)
          implicit none

               type( result_type ), intent(inout) :: result ! Результат
               logical, intent(inout) :: call_stat ! Статусная переменная процедуры
               type( input_type ), optional, intent(inout) :: input ! Входные данные

          end subroutine scats_do_periodogram_calculate

          ! Процедура для вычисления сглаженной периодограммы
          module impure subroutine scats_do_periodogram_calculate_w(result, call_stat)
          implicit none

               type( result_type ), intent(inout) :: result ! Результат

               logical, intent(inout) :: call_stat ! Статусная переменная процедуры

          end subroutine scats_do_periodogram_calculate_w

     end interface

end module scats_do_periodogram_m