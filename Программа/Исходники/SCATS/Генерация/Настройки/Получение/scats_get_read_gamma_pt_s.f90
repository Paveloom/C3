submodule ( scats_gen_settings_m ) scats_get_read_gamma_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_gamma
     module procedure scats_get_read_gamma_pt
          
          read_gamma_pt => gen_settings%read_gamma
          
     end procedure scats_get_read_gamma_pt
     
end submodule scats_get_read_gamma_pt_s