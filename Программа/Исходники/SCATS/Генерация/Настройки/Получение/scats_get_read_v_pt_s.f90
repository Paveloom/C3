submodule ( scats_gen_settings_m ) scats_get_read_v_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_v
     module procedure scats_get_read_v_pt
          
          read_v_pt => gen_settings%read_v
          
     end procedure scats_get_read_v_pt
     
end submodule scats_get_read_v_pt_s