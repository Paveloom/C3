module scats_result_m ! Модуль, содержащий описание типа,
                      ! определяющего результат
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & SP    ! Точность целого числа статусной переменной
implicit none
     
     private
     public :: result_type ! Тип, определяющий результат
     
     ! Тип, определяющий результат
     type result_type
          
          real(RP), allocatable, dimension(:) :: t ! Массив времени
          real(RP), allocatable, dimension(:) :: x ! Массив значений

          contains

          ! Процедура для освобождения памяти из-под результата
          procedure :: deallocate => scats_result_deallocate

     end type result_type
     
     interface

          ! Процедура для вывода ошибок для других процедур, связанных с результатом
          module impure subroutine scats_log_result_error(error_code)
          implicit none
               
               character(*), intent(in) :: error_code ! Код ошибки

          end subroutine scats_log_result_error

          ! Процедура для освобождения памяти из-под результата
          module subroutine scats_result_deallocate(result)
          implicit none
          
               class( result_type ) :: result
          
          end subroutine scats_result_deallocate
     
     end interface

end module scats_result_m