module scats_do_check_m ! Модуль, содержащий процедуру для проверки
                        ! на совпадение форм входных данных и результата
use prec_m, only : IP, & ! Точность целых чисел, используемых в программе
                 & SP, & ! Точность целого числа статусной переменной
                 & JP, & ! Точность целого числа счетчика и индекса
                 & LP    ! Число байт для хранения логической переменной
use scats_input_m, only : input_type ! Тип, определяющий входные данные
use scats_result_m, only : result_type ! Тип, определяющий результат
use scats_do_errors_m, only : scats_log_do_error ! Процедура для вывода ошибок
implicit none
     
     private
     public :: scats_do_check ! Процедура для проверки на совпадение форм входных данных и результата
     
     interface
     
          ! Процедура для проверки на совпадение форм входных данных и результата
          module impure subroutine scats_do_check(input, result)
          implicit none
          
               type( input_type ), intent(in) :: input ! Входные данные
               type( result_type ), intent(inout) :: result ! Результат
          
          end subroutine scats_do_check
     
     end interface
     
end module scats_do_check_m