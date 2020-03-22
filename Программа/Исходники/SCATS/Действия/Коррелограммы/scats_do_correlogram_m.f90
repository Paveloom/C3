module scats_do_correlogram_m
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & SP, & ! Точность целого числа статусной переменной
                 & JP, & ! Точность целого числа счетчика и индекса
                 & LP    ! Число байт для хранения логической переменной
use scats_result_m, only : result_type ! Тип, определяющий входные данные
use scats_do_errors_m, only : scats_log_do_error ! Процедура для вывода ошибок
use scats_do_fft_m, only : scats_do_fft_calculate ! Процедура для выполнения быстрого преобразования Фурье
implicit none
     
     private
     public :: scats_do_correlogram_calculate, & ! Процедура для вычисления коррелограммы
             & scats_do_correlogram_calculate_weighted ! Процедура для вычисления взвешенной коррелограммы
     
     interface
     
          ! Процедура для вычисления коррелограммы
          module impure subroutine scats_do_correlogram_calculate(result)
          implicit none
          
               type( result_type ) :: result ! Результат
          
          end subroutine scats_do_correlogram_calculate

          ! Процедура для вычисления взвешенной коррелограммы
          module impure subroutine scats_do_correlogram_calculate_weighted(result, nfactor, a)
          implicit none
          
               type( result_type ) :: result ! Результат
               real(RP), intent(in) :: nfactor ! Множитель перед N (.ge. 0.1 .and. le. 1.0)
               real(RP), intent(in) :: a ! Множитель a весовой функции
          
          end subroutine scats_do_correlogram_calculate_weighted
     
     end interface
     
end module scats_do_correlogram_m