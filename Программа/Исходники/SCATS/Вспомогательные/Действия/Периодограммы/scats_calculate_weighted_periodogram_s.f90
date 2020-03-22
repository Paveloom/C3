submodule ( scats ) scats_calculate_weighted_periodogram_s
implicit none
     
     contains
     
     ! Вспомогательная процедура для вычисления периодограммы
     module procedure scats_calculate_weighted_periodogram
          
          call scats_do_periodogram_calculate_weighted(s%result)
          
     end procedure scats_calculate_weighted_periodogram
     
end submodule scats_calculate_weighted_periodogram_s