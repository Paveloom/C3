submodule ( scats_gen_settings_m ) scats_get_read_r_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_r
     module procedure scats_get_read_r_pt
          
          read_r_pt => gen_settings%read_r
          
     end procedure scats_get_read_r_pt
     
end submodule scats_get_read_r_pt_s