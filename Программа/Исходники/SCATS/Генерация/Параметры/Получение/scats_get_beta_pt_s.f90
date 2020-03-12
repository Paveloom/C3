submodule ( scats_gen_params_m ) scats_get_beta_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной beta
     module procedure scats_get_beta_pt
          
          beta_pt => gen_params%beta
          
     end procedure scats_get_beta_pt
     
end submodule scats_get_beta_pt_s