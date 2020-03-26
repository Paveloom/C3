submodule ( scats ) scats_calculate_periodogram_s
implicit none

     contains

     ! Вспомогательная процедура для вычисления периодограммы
     module procedure scats_calculate_periodogram

          call scats_do_periodogram_calculate(s%result)

     end procedure scats_calculate_periodogram

end submodule scats_calculate_periodogram_s