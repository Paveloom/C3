submodule ( gen_settings_m ) get_read_alpha_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_alpha
     module procedure get_read_alpha_pt
          
          read_alpha_pt => gen_settings%read_alpha
          
     end procedure get_read_alpha_pt
     
end submodule get_read_alpha_pt_s