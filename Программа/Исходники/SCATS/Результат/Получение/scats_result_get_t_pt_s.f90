submodule ( scats_result_m ) scats_result_get_t_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя на массив времени
     module procedure scats_result_get_t_pt
          
          t_pt => result%t
          
     end procedure scats_result_get_t_pt
     
end submodule scats_result_get_t_pt_s