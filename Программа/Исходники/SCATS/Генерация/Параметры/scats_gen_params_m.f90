module scats_gen_params_m ! Модуль, содержащий тип, определяющий параметры,
                          ! и процедуры, связанные с ним
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & SP, & ! Точность целого числа статусной переменной
                 & UP, & ! Точность целого числа номера дескриптора файла
                 & LP    ! Число байт для хранения логической переменной
use scats_gen_settings_m, only : gen_settings_type ! Тип, определяющий настройки считывания
                                                   ! параметров генератора
implicit none

     private
     public :: gen_params_type ! Тип, определяющий параметры генератора

     ! Тип, определяющий параметры генератора
     type gen_params_type

          type( gen_settings_type ), public :: settings ! Настройки считывания
                                                        ! параметров генератора

          integer(IP) :: N ! Размер выборки

          real(RP) :: delta_t ! Шаг выборки
          real(RP) :: q ! Уровень значимости (не используется при генерации данных)
          real(RP) :: alpha, beta ! Параметры линейного тренда

          integer(IP) :: r ! Число гармонических компонент

          real(RP), dimension(:), allocatable :: A ! Массив амплитуд
          real(RP), dimension(:), allocatable :: v ! Массив частот
          real(RP), dimension(:), allocatable :: phi ! Массив фазовых сдвигов

          real(RP) :: gamma ! Отношение «сигнал к шуму»

          logical(LP) :: ready = .false. ! Флаг, отвечающий за готовность генератора

          contains

          procedure :: read => scats_gen_params_read ! Процедура для считывания параметров для генерации временного ряда
          procedure :: deallocate => scats_gen_params_deallocate ! Процедура для освобождения памяти из-под параметров

     end type gen_params_type

     interface

          ! Процедура для считывания параметров для генерации временного ряда
          module impure subroutine scats_gen_params_read(gen_params, file, call_stat)
          implicit none

               class ( gen_params_type ), intent(inout) :: gen_params ! Параметры

               character(*), intent(in) :: file ! Имя файла для считывания
               logical, intent(inout) :: call_stat ! Статусная переменная процедуры

          end subroutine scats_gen_params_read

          ! Процедура для вывода ошибок (параметры генерации временного ряда)
          module impure subroutine scats_gen_params_log_error(error_code, call_stat, file)
          implicit none

               character(*), intent(in) :: error_code ! Код ошибки
               logical, intent(inout), optional :: call_stat ! Статусная переменная процедуры
               character(*), intent(in), optional :: file ! Имя файла для считывания

          end subroutine scats_gen_params_log_error

          ! Процедура для освобождения памяти из-под параметров
          module impure subroutine scats_gen_params_deallocate(gen_params)
          implicit none

               class ( gen_params_type ), intent(inout) :: gen_params ! Параметры

          end subroutine scats_gen_params_deallocate

     end interface

end module scats_gen_params_m
