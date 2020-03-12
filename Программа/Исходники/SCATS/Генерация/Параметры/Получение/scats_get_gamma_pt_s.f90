submodule ( scats_gen_params_m ) scats_get_gamma_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной gamma
     module procedure scats_get_gamma_pt
          
          gamma_pt => gen_params%gamma
          
     end procedure scats_get_gamma_pt
     
end submodule scats_get_gamma_pt_s