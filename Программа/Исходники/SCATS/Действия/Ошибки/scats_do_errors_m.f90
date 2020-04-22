module scats_do_errors_m ! Модуль, содержащий процедуру
                         ! для вывода ошибок (действия)
use scats_input_m, only : input_type ! Тип, определяющий входные данные
use scats_result_m, only : result_type ! Тип, определяющий результат
implicit none

     private
     public :: scats_do_errors_log_error ! Процедура для вывода ошибок (действия)

     interface

          ! Процедура для вывода ошибок (действия)
          module subroutine scats_do_errors_log_error(error_code, input, result)
          implicit none

               character(*), intent(in) :: error_code ! Код ошибки

               type( input_type ), intent(inout), optional :: input ! Входные данные
               type( result_type ), intent(inout), optional :: result ! Результат

          end subroutine scats_do_errors_log_error

     end interface

end module scats_do_errors_m