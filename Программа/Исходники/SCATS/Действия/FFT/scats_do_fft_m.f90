module scats_do_fft_m ! Модуль, содержащий процедуры для выполнения
                      ! быстрого преобразования Фурье
use prec_m, only : RP, & ! Точность вещественных чисел, используемых в программе
                 & IP, & ! Точность целых чисел, используемых в программе
                 & SP, & ! Точность целого числа статусной переменной
                 & JP, & ! Точность целого числа счетчика и индекса
                 & LP    ! Число байт для хранения логической переменной
implicit none
     
     private
     public :: scats_do_fft_calculate ! Процедура для выполнения быстрого преобразования Фурье
     
     interface

          ! Процедура для выполнения быстрого преобразования Фурье
          module pure subroutine scats_do_fft_calculate(a, n, n_d, lg_n, invert)
          implicit none
          
               complex(RP), dimension(0:), intent(inout) :: a ! Массив для преобразования
               integer(JP), intent(in) :: n ! Размер массива
               real(RP), intent(in) :: n_d ! Размер массива (вещественное)
               integer(JP), intent(in) :: lg_n ! Количество значащих бит
               logical(LP), intent(in) :: invert ! Тип преобразования (прямое / обратное)
          
          end subroutine scats_do_fft_calculate

          ! Функция для выполнения поразрядно обратной перестановки
          module pure function scats_do_fft_rev(num, lg_n) result(res)
          implicit none
          
               integer(JP), intent(in) :: num ! Число для выполнения перестановки
               integer(JP), intent(in) :: lg_n ! Количество значащих бит
               integer(JP) :: res ! Результат перестановки
          
          end function scats_do_fft_rev

     end interface
     
end module scats_do_fft_m