module SCATS ! Модуль, содержащий API алгоритма СКАВР
use scats_gen_m, only : gen_type ! Тип, содержащий типы параметров, их настроек и
                                 ! включающий в себя процедуру генерации данных
use scats_input_m, only : input_type ! Тип, определяющий входные данные
use scats_visualize_m, only : visualize_type ! Тип, содержащий процедуры для визуализации
implicit none
     
     private
     public :: SCATS_API ! API модуля
     
     type SCATS_API

          type( input_type ) :: input ! Экземпляр API для взаимодействия с входными данными
          type( gen_type ) :: gen ! Экземпляр API для генерации временного ряда
          type( visualize_type ) :: visualize ! Экземпляр API для визуализации

          contains

          ! Вспомогательная процедура для вызова генератора временного ряда
          procedure :: generate => scats_generate

          ! Процедура для общего освобождения памяти
          procedure :: deallocate => scats_deallocate

     end type SCATS_API

     interface
     
          ! Вспомогательная процедура для вызова генератора временного ряда
          module impure subroutine scats_generate(s)
          implicit none
          
               class( SCATS_API ), intent(inout) :: s ! Экземпляр API модуля
          
          end subroutine scats_generate

          ! Процедура для общего освобождения памяти
          module impure subroutine scats_deallocate(s)
          implicit none
          
               class( SCATS_API ), intent(inout) :: s ! Экземпляр API модуля
          
          end subroutine scats_deallocate
     
     end interface

end module SCATS