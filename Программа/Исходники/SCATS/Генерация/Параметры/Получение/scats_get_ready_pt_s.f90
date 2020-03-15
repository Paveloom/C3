submodule ( scats_gen_params_m ) scats_get_ready_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной ready
     module procedure scats_get_ready_pt
          
          ready_pt => gen_params%ready
          
     end procedure scats_get_ready_pt
     
end submodule scats_get_ready_pt_s