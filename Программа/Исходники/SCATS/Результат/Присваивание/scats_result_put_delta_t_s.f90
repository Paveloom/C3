submodule ( scats_result_m ) scats_result_put_delta_t_s
implicit none
     
     contains
     
     ! Процедура для присваивания значения шагу выборки
     module procedure scats_result_put_delta_t
          
          result%delta_t = value
          
     end procedure scats_result_put_delta_t
     
end submodule scats_result_put_delta_t_s