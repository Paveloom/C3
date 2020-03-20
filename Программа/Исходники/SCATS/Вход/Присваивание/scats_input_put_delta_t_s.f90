submodule ( scats_input_m ) scats_input_put_delta_t_s
implicit none
     
     contains
     
     ! Процедура для присваивания значения шагу выборки
     module procedure scats_input_put_delta_t
          
          input%delta_t = value
          
     end procedure scats_input_put_delta_t
     
end submodule scats_input_put_delta_t_s