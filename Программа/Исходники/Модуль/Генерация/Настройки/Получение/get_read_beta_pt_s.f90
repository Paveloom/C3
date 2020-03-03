submodule ( gen_settings_m ) get_read_beta_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_beta
     module procedure get_read_beta_pt
          
          read_beta_pt => gen_settings%read_beta
          
     end procedure get_read_beta_pt
     
end submodule get_read_beta_pt_s