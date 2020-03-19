module scats_result_m ! Модуль, содержащий описание типа,
                      ! определяющего результат
use prec_m, only : RP ! Точность вещественных чисел, используемых в программе
implicit none
     
     private
     public :: result_type ! Тип, определяющий результат
     
     ! Тип, определяющий результат
     type result_type
          
          real(RP), allocatable, dimension(:) :: t ! Массив времени
          real(RP), allocatable, dimension(:) :: x ! Массив значений
          
     end type result_type
     
end module scats_result_m