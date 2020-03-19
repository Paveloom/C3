submodule ( scats_result_m ) scats_result_get_x_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя на массив значений
     module procedure scats_result_get_x_pt
          
          x_pt => result%x
          
     end procedure scats_result_get_x_pt
     
end submodule scats_result_get_x_pt_s