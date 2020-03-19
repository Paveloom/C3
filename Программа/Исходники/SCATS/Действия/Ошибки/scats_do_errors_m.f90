module scats_do_errors_m ! Модуль, содержащий процедуру
                         ! для вывода ошибок
implicit none
     
     private
     public :: scats_log_do_error ! Процедура для вывода ошибок для других процедур, связанных с результатом
     
     interface
     
          ! Процедура для вывода ошибок
          module subroutine scats_log_do_error(error_code)
          implicit none
               
               character(*), intent(in) :: error_code ! Код ошибки
          
          end subroutine scats_log_do_error
     
     end interface
     
end module scats_do_errors_m