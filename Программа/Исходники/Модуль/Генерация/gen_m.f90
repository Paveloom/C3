module gen_m ! Модуль, содержащий тип, содержащий типы параметров и их настроек и
             ! включающий в себя процедуру генерации данных
use gen_params_m, only : gen_params_type ! Тип, определяющий параметры генератора
use gen_settings_m, only : gen_settings_type ! Тип, определяющий настройки считывания
                                             ! параметров генератора
implicit none
     
     private
     public :: gen_type ! Тип, содержащий типы параметров, их настроек и
                        ! включающий в себя процедуру генерации данных
     
     ! Тип, содержащий типы параметров и их настроек и
     ! включающий в себя процедуру генерации данных
     type gen_type

          type( gen_params_type ) params ! Параметры генератора
          type( gen_settings_type ) settings ! Настройки считывания 
                                             ! параметров генератора

     end type gen_type
     
end module gen_m