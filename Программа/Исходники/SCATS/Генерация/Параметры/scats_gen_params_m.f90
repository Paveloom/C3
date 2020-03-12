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
          
          private

          type( gen_settings_type ), public :: settings ! Настройки считывания 
                                                        ! параметров генератора

          integer(IP) :: N ! Размер выборки

          real(RP) :: delta_t ! Шаг выборки
          real(RP) :: q ! Уровень значимости
          real(RP) :: alpha, beta ! Параметры линейного тренда
          
          integer(IP) :: r ! Число гармонических компонент

          real(RP), dimension(:), allocatable :: A ! Массив амплитуд
          real(RP), dimension(:), allocatable :: v ! Массив частот
          real(RP), dimension(:), allocatable :: phi ! Массив фазовых сдвигов

          real(RP) :: gamma ! Отношение «сигнал к шуму»

          contains

          procedure :: read => scats_read_gen_params ! Процедура для считывания параметров для генерации временного ряда
          procedure :: deallocate => scats_deallocate_gen_params ! Процедура для освобождения памяти из-под параметров

          ! Блок получения значения

          procedure :: get_N_pt => scats_get_N_pt ! Функция для получения указателя на значение переменной N

          procedure :: get_delta_t_pt => scats_get_delta_t_pt ! Функция для получения указателя на значение переменной delta_t
          procedure :: get_q_pt => scats_get_q_pt             ! Функция для получения указателя на значение переменной q
          procedure :: get_alpha_pt => scats_get_alpha_pt     ! Функция для получения указателя на значение переменной alpha
          procedure :: get_beta_pt => scats_get_beta_pt       ! Функция для получения указателя на значение переменной beta

          procedure :: get_r_pt => scats_get_r_pt ! Функция для получения указателя на значение переменной r

          procedure :: get_A_pt => scats_get_A_pt     ! Функция для получения указателя на значение переменной A
          procedure :: get_v_pt => scats_get_v_pt     ! Функция для получения указателя на значение переменной v
          procedure :: get_phi_pt => scats_get_phi_pt ! Функция для получения указателя на значение переменной phi

          procedure :: get_gamma_pt => scats_get_gamma_pt ! Функция для получения указателя на значение переменной gamma
          
     end type gen_params_type

     interface
     
          ! Процедура для считывания параметров для генерации временного ряда
          module impure subroutine scats_read_gen_params(gen_params, file)
          implicit none
          
               class ( gen_params_type ), intent(inout) :: gen_params ! Параметры
               character(*), intent(in) :: file ! Имя файла для считывания
          
          end subroutine scats_read_gen_params

          ! Процедура для вывода ошибок для других процедур, связанных с параметрами для генерации временного ряда
          module impure subroutine scats_log_gen_params_error(error_code, file)
          implicit none
               
               character(*), intent(in) :: error_code     ! Код ошибки
               character(*), intent(in), optional :: file ! Имя файла для считывания

          end subroutine scats_log_gen_params_error

          ! Процедура для освобождения памяти из-под параметров
          module impure subroutine scats_deallocate_gen_params(gen_params)
          implicit none
               
               class ( gen_params_type ), intent(inout) :: gen_params ! Параметры

          end subroutine scats_deallocate_gen_params

          ! Блок получения значения

          ! Функция для получения указателя на значение переменной N
          module impure function scats_get_N_pt(gen_params) result(N_pt)
          implicit none
               
               class ( gen_params_type ), target, intent(in) :: gen_params ! Параметры
               integer(IP), pointer :: N_pt ! Указатель на значение переменной N
               
          end function scats_get_N_pt

          ! Функция для получения указателя на значение переменной delta_t
          module impure function scats_get_delta_t_pt(gen_params) result(delta_t_pt)
          implicit none
               
               class ( gen_params_type ), target, intent(in) :: gen_params ! Параметры
               real(RP), pointer :: delta_t_pt ! Указатель на значение переменной delta_t
               
          end function scats_get_delta_t_pt

          ! Функция для получения указателя на значение переменной q
          module impure function scats_get_q_pt(gen_params) result(q_pt)
          implicit none
               
               class ( gen_params_type ), target, intent(in) :: gen_params ! Параметры
               real(RP), pointer :: q_pt ! Указатель на значение переменной q
               
          end function scats_get_q_pt

          ! Функция для получения указателя на значение переменной alpha
          module impure function scats_get_alpha_pt(gen_params) result(alpha_pt)
          implicit none
               
               class ( gen_params_type ), target, intent(in) :: gen_params ! Параметры
               real(RP), pointer :: alpha_pt ! Указатель на значение переменной alpha
               
          end function scats_get_alpha_pt

          ! Функция для получения указателя на значение переменной beta
          module impure function scats_get_beta_pt(gen_params) result(beta_pt)
          implicit none
               
               class ( gen_params_type ), target, intent(in) :: gen_params ! Параметры
               real(RP), pointer :: beta_pt ! Указатель на значение переменной beta
               
          end function scats_get_beta_pt

          ! Функция для получения указателя на значение переменной r
          module impure function scats_get_r_pt(gen_params) result(r_pt)
          implicit none
               
               class ( gen_params_type ), target, intent(in) :: gen_params ! Параметры
               integer(IP), pointer :: r_pt ! Указатель на значение переменной r
               
          end function scats_get_r_pt

          ! Функция для получения указателя на значение переменной A
          module impure function scats_get_A_pt(gen_params) result(A_pt)
          implicit none
               
               class ( gen_params_type ), target, intent(in) :: gen_params ! Параметры
               real(RP), dimension(:), pointer :: A_pt ! Указатель на значение переменной A
               
          end function scats_get_A_pt

          ! Функция для получения указателя на значение переменной v
          module impure function scats_get_v_pt(gen_params) result(v_pt)
          implicit none
               
               class ( gen_params_type ), target, intent(in) :: gen_params ! Параметры
               real(RP), dimension(:), pointer :: v_pt ! Указатель на значение переменной v
               
          end function scats_get_v_pt

          ! Функция для получения указателя на значение переменной phi
          module impure function scats_get_phi_pt(gen_params) result(phi_pt)
          implicit none
               
               class ( gen_params_type ), target, intent(in) :: gen_params ! Параметры
               real(RP), dimension(:), pointer :: phi_pt ! Указатель на значение переменной phi
               
          end function scats_get_phi_pt

          ! Функция для получения указателя на значение переменной gamma
          module impure function scats_get_gamma_pt(gen_params) result(gamma_pt)
          implicit none
               
               class ( gen_params_type ), target, intent(in) :: gen_params ! Параметры
               real(RP), pointer :: gamma_pt ! Указатель на значение переменной gamma
               
          end function scats_get_gamma_pt

     end interface
     
end module scats_gen_params_m
