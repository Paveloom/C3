submodule ( scats_gen_params_m ) scats_get_r_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной r
     module procedure scats_get_r_pt
          
          r_pt => gen_params%r
          
     end procedure scats_get_r_pt
     
end submodule scats_get_r_pt_s