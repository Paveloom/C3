submodule ( scats_gen_params_m ) scats_gen_params_turn_ready_s
implicit none
     
     contains
     
     ! Процедура для активации флага готовности генератора
     module procedure scats_gen_params_turn_ready
          
          gen_params%ready = .true.
          
     end procedure scats_gen_params_turn_ready
     
end submodule scats_gen_params_turn_ready_s