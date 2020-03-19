module SCATS ! Модуль, содержащий API алгоритма СКАВР
use scats_gen_m, only : gen_type ! Тип, содержащий типы параметров, их настроек и
                                 ! включающий в себя процедуру генерации данных
use scats_input_m, only : input_type ! Тип, определяющий входные данные
use scats_visualize_m, only : visualize_type ! Тип, содержащий процедуры для визуализации
use scats_result_m, only : result_type ! Тип, определяющий результат
use scats_do_m, only : scats_do_trend_remove_linear_trend ! Процедура для удаления линейного тренда из входных данных
implicit none
     
     private
     public :: SCATS_API ! API модуля
     
     type SCATS_API

          type( input_type ) :: input ! Экземпляр API для взаимодействия с входными данными
          type( gen_type ) :: gen ! Экземпляр API для генерации временного ряда
          type( visualize_type ) :: visualize ! Экземпляр API для визуализации
          type( result_type ) :: result ! Экземпляр API для взаимодействия с результатом

          contains

          ! Вспомогательная процедура для вызова генератора временного ряда
          procedure :: generate => scats_generate

          ! Процедура для общего освобождения памяти
          procedure :: deallocate => scats_deallocate

          ! Вспомогательная процедура для вызова процедуры,
          ! извлекающей линейный тренд из данных
          procedure :: remove_linear_trend => scats_remove_linear_trend

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

          ! Вспомогательная процедура для вызова процедуры,
          ! извлекающей линейный тренд из данных
          module impure subroutine scats_remove_linear_trend(s)
          implicit none
          
               class( SCATS_API ), intent(inout) :: s ! Экземпляр API модуля
          
          end subroutine scats_remove_linear_trend
     
     end interface

end module SCATS