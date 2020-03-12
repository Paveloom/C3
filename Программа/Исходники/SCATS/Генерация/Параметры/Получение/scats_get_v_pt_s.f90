submodule ( scats_gen_params_m ) scats_get_v_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной v
     module procedure scats_get_v_pt
          
          v_pt => gen_params%v
          
     end procedure scats_get_v_pt
     
end submodule scats_get_v_pt_s