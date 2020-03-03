submodule ( gen_settings_m ) get_read_v_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_v
     module procedure get_read_v_pt
          
          read_v_pt => gen_settings%read_v
          
     end procedure get_read_v_pt
     
end submodule get_read_v_pt_s