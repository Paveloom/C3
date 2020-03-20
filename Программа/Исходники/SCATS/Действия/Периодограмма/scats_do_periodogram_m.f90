module scats_do_periodogram_m ! Модуль, содержащий процедуры 
                              ! для вычисления периодограммы
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & SP, & ! Точность целого числа статусной переменной
                 & JP    ! Точность целого числа счетчика и индекса
use scats_result_m, only : result_type ! Тип, определяющий входные данные
use scats_do_errors_m, only : scats_log_do_error ! Процедура для вывода ошибок
implicit none
     
     private
     public :: scats_do_periodogram_calculate ! Процедура для вычисления периодограммы
     
     interface
     
          ! Процедура для вычисления периодограммы
          module impure subroutine scats_do_periodogram_calculate(result)
          implicit none
          
               type( result_type ) :: result ! Результат
          
          end subroutine scats_do_periodogram_calculate

          ! Процедура для выполнения быстрого преобразования Фурье
          module pure subroutine scats_do_periodogram_fft(a, n, n_d, lg_n)
          implicit none
          
               complex(RP), dimension(0:), intent(inout) :: a ! Массив для преобразования
               integer(JP), intent(in) :: n ! Размер массива
               real(RP), intent(in) :: n_d ! Размер массива (вещественное)
               integer(JP), intent(in) :: lg_n ! Количество значащих бит
          
          end subroutine scats_do_periodogram_fft

          ! Функция для выполнения поразрядно обратной перестановки
          module pure function scats_do_periodogram_rev(num, lg_n) result(res)
          implicit none
          
               integer(JP), intent(in) :: num ! Число для выполнения перестановки
               integer(JP), intent(in) :: lg_n ! Количество значащих бит
               integer(JP) :: res ! Результат перестановки
          
          end function scats_do_periodogram_rev
     
     end interface
     
end module scats_do_periodogram_m