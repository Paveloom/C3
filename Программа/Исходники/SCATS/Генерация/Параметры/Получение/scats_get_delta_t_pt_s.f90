submodule ( scats_gen_params_m ) scats_get_delta_t_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной delta_t
     module procedure scats_get_delta_t_pt
          
          delta_t_pt => gen_params%delta_t
          
     end procedure scats_get_delta_t_pt
     
end submodule scats_get_delta_t_pt_s