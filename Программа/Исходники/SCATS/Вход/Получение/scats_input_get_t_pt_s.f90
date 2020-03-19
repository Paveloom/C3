submodule ( scats_input_m ) scats_input_get_t_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя на массив времени
     module procedure scats_input_get_t_pt
          
          t_pt => input%t
          
     end procedure scats_input_get_t_pt
     
end submodule scats_input_get_t_pt_s