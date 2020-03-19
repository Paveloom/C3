module scats_result_m ! Модуль, содержащий описание типа,
                      ! определяющего результат
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & RF, & ! Формат вывода вещественных чисел
                 & SP, & ! Точность целого числа статусной переменной
                 & UP, & ! Точность целого числа номера дескриптора файла
                 & FP    ! Число байт для хранения вспомогательной строки
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

          ! Процедура для записи результата в файл
          procedure :: write => scats_result_write_to_file

          ! Функция для получения указателя на массив времени
          procedure :: get_t_pt => scats_result_get_t_pt

          ! Функция для получения указателя на массив значений
          procedure :: get_x_pt => scats_result_get_x_pt

          ! Процедура для присваивания значений массиву времени
          procedure :: put_t => scats_result_put_t

          ! Процедура для присваивания значений массиву значений
          procedure :: put_x => scats_result_put_x

     end type result_type
     
     interface

          ! Процедура для вывода ошибок для других процедур, связанных с результатом
          module impure subroutine scats_log_result_error(error_code, file)
          implicit none
               
               character(*), intent(in) :: error_code ! Код ошибки
               character(*), intent(in), optional :: file ! Файл для записи

          end subroutine scats_log_result_error

          ! Процедура для освобождения памяти из-под результата
          module subroutine scats_result_deallocate(result)
          implicit none
          
               class( result_type ), intent(inout) :: result ! Результат
          
          end subroutine scats_result_deallocate

          ! Процедура для записи результата в файл
          module impure subroutine scats_result_write_to_file(result, file)
          implicit none
               
               class( result_type ), intent(in) :: result ! Результат
               character(*), intent(in) :: file ! Файл для записи

          end subroutine scats_result_write_to_file
     
          ! Функция для получения указателя на массив времени
          module function scats_result_get_t_pt(result) result(t_pt)
          implicit none
          
               class( result_type ), intent(in), target :: result ! Результат
               real(RP), dimension(:), pointer :: t_pt ! Массив времени
          
          end function scats_result_get_t_pt

          ! Функция для получения указателя на массив значений
          module function scats_result_get_x_pt(result) result(x_pt)
          implicit none
          
               class( result_type ), intent(in), target :: result ! Результат
               real(RP), dimension(:), pointer :: x_pt ! Массив значений
          
          end function scats_result_get_x_pt

          ! Процедура для присваивания значений массиву времени
          module pure subroutine scats_result_put_t(result, array)
          implicit none
          
               class( result_type ), intent(inout) :: result ! Результат
               real(RP), dimension(:), intent(in) :: array ! Массив времени
          
          end subroutine scats_result_put_t

          ! Процедура для присваивания значений массиву значений
          module pure subroutine scats_result_put_x(result, array)
          implicit none
          
               class( result_type ), intent(inout) :: result ! Результат
               real(RP), dimension(:), intent(in) :: array ! Массив значений
          
          end subroutine scats_result_put_x

     end interface

end module scats_result_m