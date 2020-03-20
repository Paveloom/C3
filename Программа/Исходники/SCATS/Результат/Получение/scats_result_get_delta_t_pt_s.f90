submodule ( scats_result_m ) scats_result_get_delta_t_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя на шаг выборки
     module procedure scats_result_get_delta_t_pt
          
          delta_t_pt => result%delta_t
          
     end procedure scats_result_get_delta_t_pt
     
end submodule scats_result_get_delta_t_pt_s