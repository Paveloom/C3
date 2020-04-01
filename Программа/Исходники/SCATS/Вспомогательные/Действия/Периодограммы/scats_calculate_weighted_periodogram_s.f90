submodule ( scats ) scats_calculate_weighted_periodogram_s
implicit none

     contains

     ! Вспомогательная процедура для вычисления взвешенной периодограммы
     module procedure scats_calculate_weighted_periodogram

          ! Вызов процедуры для вычисления взвешенной периодограммы
          call scats_do_periodogram_calculate_w(s%result)

     end procedure scats_calculate_weighted_periodogram

end submodule scats_calculate_weighted_periodogram_s