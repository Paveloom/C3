module scats_input_m ! Модуль, содержащий тип, определяющий
                     ! входные данные и связанные с ними процедуры
use prec_m, only : RP ! Точность вещественных чисел, используемых в программе
implicit none
     
     private
     public :: input_type ! Тип, определяющий входные данные
     
     ! Тип, определяющий входные данные
     type input_type
          
          real(RP), allocatable, dimension(:) :: t ! Массив времени
          real(RP), allocatable, dimension(:) :: x ! Массив значений
          
     end type input_type
     
end module scats_input_m