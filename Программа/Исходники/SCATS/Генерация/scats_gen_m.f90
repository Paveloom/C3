module scats_gen_m ! Модуль, содержащий тип, содержащий тип
                   ! параметров и процедуру генерации данных
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & SP, & ! Точность целого числа статусной переменной
                 & JP    ! Точность целого числа счетчика и индекса
use scats_gen_params_m, only : gen_params_type ! Тип, определяющий параметры генератора
use scats_input_m, only : input_type ! Тип, определяющий входные данные
implicit none
     
     private
     public :: gen_type ! Тип, содержащий тип параметров и
                        ! процедуру генерации данных

     real(RP), parameter :: pi = 4._RP * atan(1._RP) ! Число pi 
     
     ! Тип, содержащий тип параметров и
     ! процедуру генерации данных
     type gen_type

          type( gen_params_type ) :: params ! Параметры генератора

          contains

          ! Процедура для вызова генератора временного ряда
          procedure :: generate => scats_gen_generate

     end type gen_type
     
     interface
     
          ! Процедура для вывода ошибок для процедуры генерации
          module impure subroutine scats_log_gen_error(error_code, file)
          implicit none
               
               character(*), intent(in) :: error_code     ! Код ошибки
               character(*), intent(in), optional :: file ! Имя файла для считывания

          end subroutine scats_log_gen_error

          ! Функция для получения значения равномерно распределенного случайного числа  
          module impure real(RP) function scats_generate_random_uniform()
          implicit none

          end function scats_generate_random_uniform

          ! Процедура для генерации массива значений нормально распределенных случайных величин
          module impure subroutine scats_generate_random_array(length, array)
          implicit none
               
               integer(JP) :: length ! Длина массива значений случайных чисел
               real(RP), dimension(0:), intent(inout) :: array ! Массив значений случайных чисел

          end subroutine scats_generate_random_array

          module impure subroutine scats_gen_generate(gen, input)
          implicit none
          
               class(gen_type), intent(in) :: gen ! Экземпляр API генератора
               type(input_type), intent(inout) :: input ! Входные данные
          
          end subroutine scats_gen_generate
     
     end interface

end module scats_gen_m