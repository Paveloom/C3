submodule ( scats_gen_settings_m ) scats_get_read_N_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_N
     module procedure scats_get_read_N_pt
          
          read_N_pt => gen_settings%read_N
          
     end procedure scats_get_read_N_pt
     
end submodule scats_get_read_N_pt_s