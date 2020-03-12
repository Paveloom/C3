submodule ( scats_gen_params_m ) scats_get_alpha_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной alpha
     module procedure scats_get_alpha_pt
          
          alpha_pt => gen_params%alpha
          
     end procedure scats_get_alpha_pt
     
end submodule scats_get_alpha_pt_s