submodule ( scats ) scats_calculate_correlogram_s
implicit none

     contains

     ! Вспомогательная процедура для вычисления коррелограммы
     module procedure scats_calculate_correlogram

          call scats_do_correlogram_calculate(s%result)

     end procedure scats_calculate_correlogram

end submodule scats_calculate_correlogram_s