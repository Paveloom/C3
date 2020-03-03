submodule ( gen_settings_m ) get_read_gamma_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_gamma
     module procedure get_read_gamma_pt
          
          read_gamma_pt => gen_settings%read_gamma
          
     end procedure get_read_gamma_pt
     
end submodule get_read_gamma_pt_s