submodule ( scats_gen_params_m ) scats_get_A_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной A
     module procedure scats_get_A_pt
          
          A_pt => gen_params%A
          
     end procedure scats_get_A_pt
     
end submodule scats_get_A_pt_s