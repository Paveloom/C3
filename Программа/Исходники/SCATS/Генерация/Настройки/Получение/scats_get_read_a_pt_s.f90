submodule ( scats_gen_settings_m ) scats_get_read_A_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_A
     module procedure scats_get_read_A_pt
          
          read_A_pt => gen_settings%read_A
          
     end procedure scats_get_read_A_pt
     
end submodule scats_get_read_A_pt_s