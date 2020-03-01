module scats ! Модуль, содержащий API алгоритма СКАВР
use gen_params_m, only : gen_params_type ! Тип, определяющий параметры 
                                         ! для генерации временного ряда
implicit none
     
     private
     public :: scats_api ! API модуля
     
     type scats_api

          type( gen_params_type ) gen ! Параметры для генерации временного ряда

     end type scats_api
     
end module scats