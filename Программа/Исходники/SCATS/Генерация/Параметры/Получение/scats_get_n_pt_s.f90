submodule ( scats_gen_params_m ) scats_get_N_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной N
     module procedure scats_get_N_pt
          
          N_pt => gen_params%N
          
     end procedure scats_get_N_pt
     
end submodule scats_get_N_pt_s