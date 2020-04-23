module scats_do_trend_m ! Модуль, содержащий процедуры для извлечения тренда
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & SP, & ! Точность целого числа статусной переменной
                 & JP    ! Точность целого числа счетчика и индекса
use scats_input_m, only : input_type ! Тип, определяющий входные данные
use scats_result_m, only : result_type ! Тип, определяющий результат
use scats_do_errors_m, only : scats_do_errors_log_error ! Процедура для вывода ошибок (действия)
use scats_do_check_m, only : scats_do_check ! Процедура для проверки на совпадение форм входных данных и результата
implicit none

     private
     public :: scats_do_trend_remove_linear_trend ! Процедура для удаления линейного тренда из входных данных

     interface

          ! Процедура для удаления линейного тренда из входных данных
          module impure subroutine scats_do_trend_remove_linear_trend(input, result, call_stat)
          implicit none

               type( input_type ), intent(inout) :: input ! Входные данные
               type( result_type ), intent(inout) :: result ! Результат

               logical, intent(inout) :: call_stat ! Статусная переменная процедуры

          end subroutine scats_do_trend_remove_linear_trend

     end interface

end module scats_do_trend_m