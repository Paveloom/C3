submodule ( scats_gen_params_m ) scats_get_phi_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной phi
     module procedure scats_get_phi_pt
          
          phi_pt => gen_params%phi
          
     end procedure scats_get_phi_pt
     
end submodule scats_get_phi_pt_s