submodule ( scats_gen_params_m ) scats_get_q_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной q
     module procedure scats_get_q_pt
          
          q_pt => gen_params%q
          
     end procedure scats_get_q_pt
     
end submodule scats_get_q_pt_s