submodule ( scats_gen_settings_m ) scats_get_read_q_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_q
     module procedure scats_get_read_q_pt
          
          read_q_pt => gen_settings%read_q
          
     end procedure scats_get_read_q_pt
     
end submodule scats_get_read_q_pt_s