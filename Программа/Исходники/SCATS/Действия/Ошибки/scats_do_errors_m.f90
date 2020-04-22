module scats_do_errors_m ! Модуль, содержащий процедуру
                         ! для вывода ошибок (действия)
use scats_input_m, only : input_type ! Тип, определяющий входные данные
use scats_result_m, only : result_type ! Тип, определяющий результат
implicit none

     private
     public :: scats_do_errors_log_error ! Процедура для вывода ошибок (действия)

     interface

          ! Процедура для вывода ошибок (действия)
          module subroutine scats_do_errors_log_error(error_code, call_stat)
          implicit none

               character(*), intent(in) :: error_code ! Код ошибки

               logical, intent(inout) :: call_stat ! Статусная переменная

          end subroutine scats_do_errors_log_error

     end interface

end module scats_do_errors_m