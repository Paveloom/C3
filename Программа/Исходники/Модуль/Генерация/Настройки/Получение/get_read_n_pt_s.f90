submodule ( gen_settings_m ) get_read_N_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_N
     module procedure get_read_N_pt
          
          read_N_pt => gen_settings%read_N
          
     end procedure get_read_N_pt
     
end submodule get_read_N_pt_s