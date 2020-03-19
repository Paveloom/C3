submodule ( scats_input_m ) scats_input_get_delta_t_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя на шаг выборки
     module procedure scats_input_get_delta_t_pt
          
          delta_t_pt => input%delta_t
          
     end procedure scats_input_get_delta_t_pt
     
end submodule scats_input_get_delta_t_pt_s