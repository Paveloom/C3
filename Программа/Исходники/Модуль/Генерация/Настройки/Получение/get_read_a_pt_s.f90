submodule ( gen_settings_m ) get_read_A_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_A
     module procedure get_read_A_pt
          
          read_A_pt => gen_settings%read_A
          
     end procedure get_read_A_pt
     
end submodule get_read_A_pt_s