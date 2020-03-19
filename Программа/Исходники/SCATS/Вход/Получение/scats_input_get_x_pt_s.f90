submodule ( scats_input_m ) scats_input_get_x_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя на массив значений
     module procedure scats_input_get_x_pt
          
          x_pt => input%x
          
     end procedure scats_input_get_x_pt
     
end submodule scats_input_get_x_pt_s