submodule ( gen_settings_m ) get_read_r_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_r
     module procedure get_read_r_pt
          
          read_r_pt => gen_settings%read_r
          
     end procedure get_read_r_pt
     
end submodule get_read_r_pt_s