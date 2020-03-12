submodule ( scats_gen_settings_m ) scats_turn_read_delta_t_on_s
implicit none
     
     contains
     
     ! Процедура для включения считывания переменной delta_t
     module procedure scats_turn_read_delta_t_on
          
          gen_settings%read_delta_t = .true.
          
     end procedure scats_turn_read_delta_t_on
     
end submodule scats_turn_read_delta_t_on_s