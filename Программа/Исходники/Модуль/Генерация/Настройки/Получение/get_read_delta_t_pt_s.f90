submodule ( gen_settings_m ) get_read_delta_t_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_delta_t
     module procedure get_read_delta_t_pt
          
          read_delta_t_pt => gen_settings%read_delta_t
          
     end procedure get_read_delta_t_pt
     
end submodule get_read_delta_t_pt_s