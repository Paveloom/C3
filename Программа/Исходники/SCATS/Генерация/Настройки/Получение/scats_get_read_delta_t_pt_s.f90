submodule ( scats_gen_settings_m ) scats_get_read_delta_t_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_delta_t
     module procedure scats_get_read_delta_t_pt
          
          read_delta_t_pt => gen_settings%read_delta_t
          
     end procedure scats_get_read_delta_t_pt
     
end submodule scats_get_read_delta_t_pt_s