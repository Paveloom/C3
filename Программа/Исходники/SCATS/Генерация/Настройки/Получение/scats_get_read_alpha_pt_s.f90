submodule ( scats_gen_settings_m ) scats_get_read_alpha_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_alpha
     module procedure scats_get_read_alpha_pt
          
          read_alpha_pt => gen_settings%read_alpha
          
     end procedure scats_get_read_alpha_pt
     
end submodule scats_get_read_alpha_pt_s