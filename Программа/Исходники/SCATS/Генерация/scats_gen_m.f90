module scats_gen_m ! Модуль, содержащий тип, содержащий тип
                   ! параметров и процедуру генерации данных
use scats_gen_params_m, only : gen_params_type ! Тип, определяющий параметры генератора
use scats_input_m, only : input_type ! Тип, определяющий входные данные
implicit none
     
     private
     public :: gen_type ! Тип, содержащий тип параметров и
                        ! процедуру генерации данных
     
     ! Тип, содержащий тип параметров и
     ! процедуру генерации данных
     type gen_type

          type( gen_params_type ) :: params ! Параметры генератора

          contains

          ! Процедура для вызова генератора временного ряда
          procedure :: generate => scats_gen_generate

     end type gen_type
     
     interface
     
          module subroutine scats_gen_generate(gen, input)
          implicit none
          
               class(gen_type), intent(in) :: gen ! Экземпляр API генератора
               type(input_type), intent(inout) :: input ! Входные данные
          
          end subroutine scats_gen_generate
     
     end interface

end module scats_gen_m