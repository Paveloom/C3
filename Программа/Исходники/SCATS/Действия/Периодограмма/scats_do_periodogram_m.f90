module scats_do_periodogram_m ! Модуль, содержащий процедуры 
                              ! для вычисления периодограммы
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & SP, & ! Точность целого числа статусной переменной
                 & JP    ! Точность целого числа счетчика и индекса
use scats_result_m, only : result_type ! Тип, определяющий входные данные
implicit none
     
     private
     public :: scats_do_periodogram_calculate ! Процедура для вычисления периодограммы
     
     interface
     
          ! Процедура для вычисления периодограммы
          module subroutine scats_do_periodogram_calculate(result)
          implicit none
          
               type( result_type ) :: result ! Результат
          
          end subroutine scats_do_periodogram_calculate
     
     end interface
     
end module scats_do_periodogram_m