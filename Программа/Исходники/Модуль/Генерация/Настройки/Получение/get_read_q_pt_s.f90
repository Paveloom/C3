submodule ( gen_settings_m ) get_read_q_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_q
     module procedure get_read_q_pt
          
          read_q_pt => gen_settings%read_q
          
     end procedure get_read_q_pt
     
end submodule get_read_q_pt_s