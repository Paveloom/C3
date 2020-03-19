submodule ( scats_result_m ) scats_result_put_t_s
implicit none
     
     contains
     
     ! Процедура для присваивания значений массиву времени
     module procedure scats_result_put_t
          
          result%t(:) = array(:)
          
     end procedure scats_result_put_t
     
end submodule scats_result_put_t_s