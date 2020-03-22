submodule ( scats ) scats_calculate_weighted_correlogram_s
implicit none
     
     contains
     
     ! Вспомогательная процедура для вычисления взвешенной коррелограммы
     module procedure scats_calculate_weighted_correlogram
          
          call scats_do_correlogram_calculate_w(s%result, nfactor, a)
          
     end procedure scats_calculate_weighted_correlogram
     
end submodule scats_calculate_weighted_correlogram_s