module scats_do_check_m ! Модуль, содержащий процедуру для проверки
                        ! на совпадение форм входных данных и результата
use scats_input_m, only : input_type ! Тип, определяющий входные данные
use scats_result_m, only : result_type ! Тип, определяющий результат
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