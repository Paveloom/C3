submodule ( scats_gen_settings_m ) scats_get_read_beta_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_beta
     module procedure scats_get_read_beta_pt
          
          read_beta_pt => gen_settings%read_beta
          
     end procedure scats_get_read_beta_pt
     
end submodule scats_get_read_beta_pt_s