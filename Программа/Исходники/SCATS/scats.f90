module SCATS ! Модуль, содержащий API алгоритма СКАВР
use scats_gen_m, only : gen_type ! Тип, содержащий типы параметров, их настроек и
                                 ! включающий в себя процедуру генерации данных
use scats_input_m, only : input_type ! Тип, определяющий входные данные
implicit none
     
     private
     public :: SCATS_API ! API модуля
     
     type SCATS_API

          type( input_type ) :: input ! Входные данные
          type( gen_type ) :: gen ! Экземпляр API генератора

          contains

          procedure :: generate => scats_generate

     end type SCATS_API

     interface
     
          ! Вспомогательная процедура для вызова генератора временного ряда
          module subroutine scats_generate(s)
          implicit none
          
               class( SCATS_API ), intent(inout) :: s ! Экземпляр API модуля
          
          end subroutine scats_generate
     
     end interface

end module SCATS