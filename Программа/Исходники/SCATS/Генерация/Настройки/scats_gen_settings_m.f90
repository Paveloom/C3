module scats_gen_settings_m ! Модуль, содержащий тип, определяющий
                            ! настройки считывания параметров
use prec_m, only : SP, & ! Точность целого числа статусной переменной
                 & UP, & ! Точность целого числа номера дескриптора файла
                 & LP    ! Число байт для хранения логической переменной
implicit none

     private
     public :: gen_settings_type ! Тип, определяющий настройки
                                 ! считывания параметров генератора

     ! Тип, определяющий настройки считывания параметров генератора
     type gen_settings_type

          logical(LP) :: read_N = .true. ! Считывать размер выборки?

          logical(LP) :: read_delta_t = .true. ! Считывать шаг выборки?
          logical(LP) :: read_q = .true.       ! Считывать уровень значимости?
          logical(LP) :: read_alpha = .true.   ! Считывать параметр \alpha линейного тренда?
          logical(LP) :: read_beta = .true.    ! Считывать параметр \beta линейного тренда?

          logical(LP) :: read_r = .true. ! Считывать число гармонических компонент?

          logical(LP) :: read_A = .true.   ! Считывать массив амплитуд?
          logical(LP) :: read_v = .true.   ! Считывать массив частот?
          logical(LP) :: read_phi = .true. ! Считывать массив фазовых сдвигов?

          logical(LP) :: read_gamma = .true. ! Считывать отношение «сигнал к шуму»?

          contains

          ! Процедура для считывания настроек считывания параметров
          procedure :: read => scats_gen_settings_read

          ! Процедура для вывода ошибок (настройки считывания параметров)
          procedure, private :: log => scats_gen_settings_log_error

     end type gen_settings_type

     interface

          ! Процедура для считывания настроек считывания параметров для генерации временного ряда
          module impure subroutine scats_gen_settings_read(gen_settings, file)
          implicit none

               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания параметров
               character(*), intent(in) :: file ! Имя файла для считывания

          end subroutine scats_gen_settings_read

          ! Процедура для вывода ошибок (настройки считывания параметров)
          module impure subroutine scats_gen_settings_log_error(gen_settings, error_code, file)
          implicit none

               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания параметров
               character(*), intent(in) :: error_code     ! Код ошибки
               character(*), intent(in), optional :: file ! Имя файла для считывания

          end subroutine scats_gen_settings_log_error

     end interface

end module scats_gen_settings_m
