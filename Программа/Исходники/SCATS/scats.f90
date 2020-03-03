module SCATS ! Модуль, содержащий API алгоритма СКАВР
use scats_gen_m, only : gen_type ! Тип, содержащий типы параметров, их настроек и
                                 ! включающий в себя процедуру генерации данных
implicit none
     
     private
     public :: SCATS_API ! API модуля
     
     type SCATS_API

          type( gen_type ) gen ! Экземпляр API генератора

     end type SCATS_API
     
end module SCATS