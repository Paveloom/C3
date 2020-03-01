module SCATS ! Модуль, содержащий API алгоритма СКАВР
use gen_params_m, only : gen_params_type ! Тип, определяющий параметры 
                                         ! для генерации временного ряда
implicit none
     
     private
     public :: SCATS_API ! API модуля
     
     type SCATS_API

          type( gen_params_type ) gen ! Параметры для генерации временного ряда

     end type SCATS_API
     
end module SCATS