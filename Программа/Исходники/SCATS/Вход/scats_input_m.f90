module scats_input_m ! Модуль, содержащий тип, определяющий
                     ! входные данные и связанные с ними процедуры
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & SP    ! Точность целого числа статусной переменной
implicit none
     
     private
     public :: input_type ! Тип, определяющий входные данные
     
     ! Тип, определяющий входные данные
     type input_type
          
          real(RP), allocatable, dimension(:) :: t ! Массив времени
          real(RP), allocatable, dimension(:) :: x ! Массив значений

          contains

          ! Процедура освобождения памяти из-под входных данных
          procedure :: deallocate => scats_input_deallocate
          
     end type input_type

     interface
     
          ! Процедура освобождения памяти из-под входных данных
          module impure subroutine scats_input_deallocate(input)
          implicit none
          
               class( input_type ), intent(inout) :: input
          
          end subroutine scats_input_deallocate

          ! Процедура для вывода ошибок для других процедур, связанных с входными данными
          module impure subroutine scats_log_input_error(error_code)
          implicit none
               
               character(*), intent(in) :: error_code ! Код ошибки

          end subroutine scats_log_input_error

     end interface
     
end module scats_input_m