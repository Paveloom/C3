module gen_m ! Модуль, содержащий тип, содержащий тип
             ! параметров и процедуру генерации данных
use gen_params_m, only : gen_params_type ! Тип, определяющий параметры генератора
implicit none
     
     private
     public :: gen_type ! Тип, содержащий тип параметров и
                        ! процедуру генерации данных
     
     ! Тип, содержащий тип параметров и
     ! процедуру генерации данных
     type gen_type

          type( gen_params_type ) :: params ! Параметры генератора

     end type gen_type
     
end module gen_m