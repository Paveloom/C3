module scats_do_errors_m ! Модуль, содержащий процедуру
                         ! для вывода ошибок (действия)
implicit none

     private
     public :: scats_do_errors_log_error ! Процедура для вывода ошибок (действия)

     interface

          ! Процедура для вывода ошибок (действия)
          module subroutine scats_do_errors_log_error(error_code)
          implicit none

               character(*), intent(in) :: error_code ! Код ошибки

          end subroutine scats_do_errors_log_error

     end interface

end module scats_do_errors_m