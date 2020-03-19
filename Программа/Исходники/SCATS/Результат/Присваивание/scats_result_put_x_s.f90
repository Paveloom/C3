submodule ( scats_result_m ) scats_result_put_x_s
implicit none
     
     contains
     
     ! Процедура для присваивания значений массиву значений
     module procedure scats_result_put_x
          
          result%x(:) = array(:)
          
     end procedure scats_result_put_x
     
end submodule scats_result_put_x_s