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

          procedure :: get_read_delta_t_pt ! Функция для получения указателя на значение переменной read_delta_t
          procedure :: get_read_q_pt       ! Функция для получения указателя на значение переменной read_q
          procedure :: get_read_alpha_pt   ! Функция для получения указателя на значение переменной read_alpha
          procedure :: get_read_beta_pt    ! Функция для получения указателя на значение переменной read_beta

          procedure :: get_read_A_pt   ! Функция для получения указателя на значение переменной read_A
          procedure :: get_read_v_pt   ! Функция для получения указателя на значение переменной read_v
          procedure :: get_read_phi_pt ! Функция для получения указателя на значение переменной read_phi

          procedure :: get_read_gamma_pt ! Функция для получения указателя на значение переменной read_gamma
          
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

          ! Функция для получения указателя на значение переменной read_delta_t
          module impure function get_read_delta_t_pt(gen_settings) result(read_delta_t_pt)
          implicit none
               
               class ( gen_settings_type ), target, intent(in) :: gen_settings ! Входные данные
               logical(LP), pointer :: read_delta_t_pt ! Указатель на значение переменной read_delta_t
               
          end function get_read_delta_t_pt

          ! Функция для получения указателя на значение переменной read_q
          module impure function get_read_q_pt(gen_settings) result(read_q_pt)
          implicit none
               
               class ( gen_settings_type ), target, intent(in) :: gen_settings ! Входные данные
               logical(LP), pointer :: read_q_pt ! Указатель на значение переменной read_q
               
          end function get_read_q_pt

          ! Функция для получения указателя на значение переменной read_alpha
          module impure function get_read_alpha_pt(gen_settings) result(read_alpha_pt)
          implicit none
               
               class ( gen_settings_type ), target, intent(in) :: gen_settings ! Входные данные
               logical(LP), pointer :: read_alpha_pt ! Указатель на значение переменной read_alpha
               
          end function get_read_alpha_pt

          ! Функция для получения указателя на значение переменной read_beta
          module impure function get_read_beta_pt(gen_settings) result(read_beta_pt)
          implicit none
               
               class ( gen_settings_type ), target, intent(in) :: gen_settings ! Входные данные
               logical(LP), pointer :: read_beta_pt ! Указатель на значение переменной read_beta
               
          end function get_read_beta_pt

          ! Функция для получения указателя на значение переменной read_A
          module impure function get_read_A_pt(gen_settings) result(read_A_pt)
          implicit none
               
               class ( gen_settings_type ), target, intent(in) :: gen_settings ! Входные данные
               logical(LP), pointer :: read_A_pt ! Указатель на значение переменной read_A
               
          end function get_read_A_pt

          ! Функция для получения указателя на значение переменной read_v
          module impure function get_read_v_pt(gen_settings) result(read_v_pt)
          implicit none
               
               class ( gen_settings_type ), target, intent(in) :: gen_settings ! Входные данные
               logical(LP), pointer :: read_v_pt ! Указатель на значение переменной read_v
               
          end function get_read_v_pt

          ! Функция для получения указателя на значение переменной read_phi
          module impure function get_read_phi_pt(gen_settings) result(read_phi_pt)
          implicit none
               
               class ( gen_settings_type ), target, intent(in) :: gen_settings ! Входные данные
               logical(LP), pointer :: read_phi_pt ! Указатель на значение переменной read_phi
               
          end function get_read_phi_pt

          ! Функция для получения указателя на значение переменной read_gamma
          module impure function get_read_gamma_pt(gen_settings) result(read_gamma_pt)
          implicit none
               
               class ( gen_settings_type ), target, intent(in) :: gen_settings ! Входные данные
               logical(LP), pointer :: read_gamma_pt ! Указатель на значение переменной read_gamma
               
          end function get_read_gamma_pt

     end interface
     
end module gen_settings_m
