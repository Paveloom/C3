module gen_settings_m ! Модуль, содержащий тип, определяющий 
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
          
          private

          logical(LP) :: read_delta_t = .true. ! Считывать шаг выборки?
          logical(LP) :: read_q = .true.       ! Считывать уровень значимости?
          logical(LP) :: read_alpha = .true.   ! Считывать параметр \alpha линейного тренда?
          logical(LP) :: read_beta = .true.    ! Считывать параметр \beta линейного тренда?
          
          logical(LP) :: read_A = .true.   ! Считывать массив амплитуд?
          logical(LP) :: read_v = .true.   ! Считывать массив частот?
          logical(LP) :: read_phi = .true. ! Считывать массив фазовых сдвигов?

          logical(LP) :: read_gamma = .true. ! Считывать отношение «сигнал к шуму»?

          contains

          procedure :: read => read_gen_settings ! Процедура для считывания настроек считывания параметров
          
     end type gen_settings_type

     interface
     
          ! Процедура для считывания настроек считывания параметров для генерации временного ряда
          module impure subroutine read_gen_settings(gen_settings, file)
          implicit none
          
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания параметров
               character(*), intent(in) :: file ! Имя файла для считывания
          
          end subroutine read_gen_settings

          ! Процедура для вывода ошибок для других процедур, связанных с
          ! настройками считывания параметров для генерации временного ряда
          module impure subroutine log_gen_settings_error(error_code, file)
          implicit none
               
               character(*), intent(in) :: error_code     ! Код ошибки
               character(*), intent(in), optional :: file ! Имя файла для считывания

          end subroutine log_gen_settings_error

     end interface
     
end module gen_settings_m
