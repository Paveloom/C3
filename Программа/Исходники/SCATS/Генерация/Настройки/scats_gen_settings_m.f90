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
          
          private

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

          procedure :: read => scats_read_gen_settings ! Процедура для считывания настроек считывания параметров

          ! Блок получения значения

          procedure :: get_read_N_pt => scats_get_read_N_pt ! Функция для получения указателя на значение переменной read_N

          procedure :: get_read_delta_t_pt => scats_get_read_delta_t_pt ! Функция для получения указателя на значение переменной read_delta_t
          procedure :: get_read_q_pt => scats_get_read_q_pt             ! Функция для получения указателя на значение переменной read_q
          procedure :: get_read_alpha_pt => scats_get_read_alpha_pt     ! Функция для получения указателя на значение переменной read_alpha
          procedure :: get_read_beta_pt => scats_get_read_beta_pt       ! Функция для получения указателя на значение переменной read_beta

          procedure :: get_read_r_pt => scats_get_read_r_pt ! Функция для получения указателя на значение переменной read_r

          procedure :: get_read_A_pt => scats_get_read_A_pt     ! Функция для получения указателя на значение переменной read_A
          procedure :: get_read_v_pt => scats_get_read_v_pt     ! Функция для получения указателя на значение переменной read_v
          procedure :: get_read_phi_pt => scats_get_read_phi_pt ! Функция для получения указателя на значение переменной read_phi

          procedure :: get_read_gamma_pt => scats_get_read_gamma_pt ! Функция для получения указателя на значение переменной read_gamma

          ! Блок смены значения
          
          procedure :: turn_read_N_on => scats_turn_read_N_on ! Процедура для включения считывания переменной N

          procedure :: turn_read_delta_t_on => scats_turn_read_delta_t_on ! Процедура для включения считывания переменной delta_t
          procedure :: turn_read_q_on => scats_turn_read_q_on             ! Процедура для включения считывания переменной q
          procedure :: turn_read_alpha_on => scats_turn_read_alpha_on     ! Процедура для включения считывания переменной alpha
          procedure :: turn_read_beta_on => scats_turn_read_beta_on       ! Процедура для включения считывания переменной beta

          procedure :: turn_read_r_on => scats_turn_read_r_on ! Процедура для включения считывания переменной r

          procedure :: turn_read_A_on => scats_turn_read_A_on     ! Процедура для включения считывания переменной A
          procedure :: turn_read_v_on => scats_turn_read_v_on     ! Процедура для включения считывания переменной v
          procedure :: turn_read_phi_on => scats_turn_read_phi_on ! Процедура для включения считывания переменной phi

          procedure :: turn_read_gamma_on => scats_turn_read_gamma_on ! Процедура для включения считывания переменной gamma

          procedure :: turn_read_N_off => scats_turn_read_N_off ! Процедура для выключения считывания переменной N

          procedure :: turn_read_delta_t_off => scats_turn_read_delta_t_off ! Процедура для выключения считывания переменной delta_t
          procedure :: turn_read_q_off => scats_turn_read_q_off             ! Процедура для выключения считывания переменной q
          procedure :: turn_read_alpha_off => scats_turn_read_alpha_off     ! Процедура для выключения считывания переменной alpha
          procedure :: turn_read_beta_off => scats_turn_read_beta_off       ! Процедура для выключения считывания переменной beta

          procedure :: turn_read_r_off => scats_turn_read_r_off ! Процедура для выключения считывания переменной r

          procedure :: turn_read_A_off => scats_turn_read_A_off     ! Процедура для выключения считывания переменной A
          procedure :: turn_read_v_off => scats_turn_read_v_off     ! Процедура для выключения считывания переменной v
          procedure :: turn_read_phi_off => scats_turn_read_phi_off ! Процедура для выключения считывания переменной phi

          procedure :: turn_read_gamma_off => scats_turn_read_gamma_off ! Процедура для выключения считывания переменной gamma

     end type gen_settings_type

     interface
     
          ! Процедура для считывания настроек считывания параметров для генерации временного ряда
          module impure subroutine scats_read_gen_settings(gen_settings, file)
          implicit none
          
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания параметров
               character(*), intent(in) :: file ! Имя файла для считывания
          
          end subroutine scats_read_gen_settings

          ! Процедура для вывода ошибок для других процедур, связанных с
          ! настройками считывания параметров для генерации временного ряда
          module impure subroutine scats_log_gen_settings_error(error_code, file)
          implicit none
               
               character(*), intent(in) :: error_code     ! Код ошибки
               character(*), intent(in), optional :: file ! Имя файла для считывания

          end subroutine scats_log_gen_settings_error

          ! Блок получения значения

          ! Функция для получения указателя на значение переменной read_N
          module impure function scats_get_read_N_pt(gen_settings) result(read_N_pt)
          implicit none
               
               class ( gen_settings_type ), target, intent(in) :: gen_settings ! Настройки считывания
               logical(LP), pointer :: read_N_pt ! Указатель на значение переменной read_N
               
          end function scats_get_read_N_pt

          ! Функция для получения указателя на значение переменной read_delta_t
          module impure function scats_get_read_delta_t_pt(gen_settings) result(read_delta_t_pt)
          implicit none
               
               class ( gen_settings_type ), target, intent(in) :: gen_settings ! Настройки считывания
               logical(LP), pointer :: read_delta_t_pt ! Указатель на значение переменной read_delta_t
               
          end function scats_get_read_delta_t_pt

          ! Функция для получения указателя на значение переменной read_q
          module impure function scats_get_read_q_pt(gen_settings) result(read_q_pt)
          implicit none
               
               class ( gen_settings_type ), target, intent(in) :: gen_settings ! Настройки считывания
               logical(LP), pointer :: read_q_pt ! Указатель на значение переменной read_q
               
          end function scats_get_read_q_pt

          ! Функция для получения указателя на значение переменной read_alpha
          module impure function scats_get_read_alpha_pt(gen_settings) result(read_alpha_pt)
          implicit none
               
               class ( gen_settings_type ), target, intent(in) :: gen_settings ! Настройки считывания
               logical(LP), pointer :: read_alpha_pt ! Указатель на значение переменной read_alpha
               
          end function scats_get_read_alpha_pt

          ! Функция для получения указателя на значение переменной read_beta
          module impure function scats_get_read_beta_pt(gen_settings) result(read_beta_pt)
          implicit none
               
               class ( gen_settings_type ), target, intent(in) :: gen_settings ! Настройки считывания
               logical(LP), pointer :: read_beta_pt ! Указатель на значение переменной read_beta
               
          end function scats_get_read_beta_pt

          ! Функция для получения указателя на значение переменной read_r
          module impure function scats_get_read_r_pt(gen_settings) result(read_r_pt)
          implicit none
               
               class ( gen_settings_type ), target, intent(in) :: gen_settings ! Настройки считывания
               logical(LP), pointer :: read_r_pt ! Указатель на значение переменной read_r
               
          end function scats_get_read_r_pt

          ! Функция для получения указателя на значение переменной read_A
          module impure function scats_get_read_A_pt(gen_settings) result(read_A_pt)
          implicit none
               
               class ( gen_settings_type ), target, intent(in) :: gen_settings ! Настройки считывания
               logical(LP), pointer :: read_A_pt ! Указатель на значение переменной read_A
               
          end function scats_get_read_A_pt

          ! Функция для получения указателя на значение переменной read_v
          module impure function scats_get_read_v_pt(gen_settings) result(read_v_pt)
          implicit none
               
               class ( gen_settings_type ), target, intent(in) :: gen_settings ! Настройки считывания
               logical(LP), pointer :: read_v_pt ! Указатель на значение переменной read_v
               
          end function scats_get_read_v_pt

          ! Функция для получения указателя на значение переменной read_phi
          module impure function scats_get_read_phi_pt(gen_settings) result(read_phi_pt)
          implicit none
               
               class ( gen_settings_type ), target, intent(in) :: gen_settings ! Настройки считывания
               logical(LP), pointer :: read_phi_pt ! Указатель на значение переменной read_phi
               
          end function scats_get_read_phi_pt

          ! Функция для получения указателя на значение переменной read_gamma
          module impure function scats_get_read_gamma_pt(gen_settings) result(read_gamma_pt)
          implicit none
               
               class ( gen_settings_type ), target, intent(in) :: gen_settings ! Настройки считывания
               logical(LP), pointer :: read_gamma_pt ! Указатель на значение переменной read_gamma
               
          end function scats_get_read_gamma_pt

          ! Блок смены значения

          ! Процедура для включения считывания переменной N
          module pure subroutine scats_turn_read_N_on(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_N_on

          ! Процедура для включения считывания переменной delta_t
          module pure subroutine scats_turn_read_delta_t_on(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_delta_t_on

          ! Процедура для включения считывания переменной q
          module pure subroutine scats_turn_read_q_on(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_q_on

          ! Процедура для включения считывания переменной alpha
          module pure subroutine scats_turn_read_alpha_on(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_alpha_on

          ! Процедура для включения считывания переменной beta
          module pure subroutine scats_turn_read_beta_on(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_beta_on

          ! Процедура для включения считывания переменной r
          module pure subroutine scats_turn_read_r_on(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_r_on

          ! Процедура для включения считывания переменной A
          module pure subroutine scats_turn_read_A_on(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_A_on

          ! Процедура для включения считывания переменной v
          module pure subroutine scats_turn_read_v_on(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_v_on

          ! Процедура для включения считывания переменной phi
          module pure subroutine scats_turn_read_phi_on(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_phi_on

          ! Процедура для включения считывания переменной gamma
          module pure subroutine scats_turn_read_gamma_on(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_gamma_on

          ! Процедура для выключения считывания переменной N
          module pure subroutine scats_turn_read_N_off(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_N_off

          ! Процедура для выключения считывания переменной delta_t
          module pure subroutine scats_turn_read_delta_t_off(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_delta_t_off

          ! Процедура для выключения считывания переменной q
          module pure subroutine scats_turn_read_q_off(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_q_off

          ! Процедура для выключения считывания переменной alpha
          module pure subroutine scats_turn_read_alpha_off(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_alpha_off

          ! Процедура для выключения считывания переменной beta
          module pure subroutine scats_turn_read_beta_off(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_beta_off

          ! Процедура для выключения считывания переменной r
          module pure subroutine scats_turn_read_r_off(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_r_off

          ! Процедура для выключения считывания переменной A
          module pure subroutine scats_turn_read_A_off(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_A_off

          ! Процедура для выключения считывания переменной v
          module pure subroutine scats_turn_read_v_off(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_v_off

          ! Процедура для выключения считывания переменной phi
          module pure subroutine scats_turn_read_phi_off(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_phi_off

          ! Процедура для выключения считывания переменной gamma
          module pure subroutine scats_turn_read_gamma_off(gen_settings)
          implicit none
               
               class ( gen_settings_type ), intent(inout) :: gen_settings ! Настройки считывания
               
          end subroutine scats_turn_read_gamma_off

     end interface
     
end module scats_gen_settings_m
