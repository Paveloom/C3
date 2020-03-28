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

          real(RP) :: delta_t ! Шаг выборки

          real(RP), allocatable, dimension(:) :: t ! Массив времени
          real(RP), allocatable, dimension(:) :: x ! Массив значений

          real(RP) :: q ! Уровень значимости
          real(RP) :: threshold ! Порог обнаружения сигнала

          real(RP), allocatable, dimension(:) :: X_FFT_ABS ! Модуль преобразованных значений

          real(RP), allocatable, dimension(:) :: v ! Массив частот периодограммы
          real(RP), allocatable, dimension(:) :: D ! Массив значений периодограммы

          real(RP), allocatable, dimension(:) :: c ! Массив значений коррелограммы
          real(RP), allocatable, dimension(:) :: cw ! Массив значений взвешенной коррелограммы

          real(RP), allocatable, dimension(:) :: Dw ! Массив значений сглаженной периодограммы

          contains

          ! Процедура для освобождения памяти из-под результата
          procedure :: deallocate => scats_result_deallocate

          ! Процедура для записи результата в файл
          procedure :: write => scats_result_write_to_file

     end type result_type

     interface

          ! Процедура для вывода ошибок (результат)
          module impure subroutine scats_result_log_error(error_code, file)
          implicit none

               character(*), intent(in) :: error_code ! Код ошибки
               character(*), intent(in), optional :: file ! Файл для записи

          end subroutine scats_result_log_error

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

     end interface

end module scats_result_m