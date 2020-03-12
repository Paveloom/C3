submodule ( scats_gen_settings_m ) scats_turn_read_delta_t_off_s
implicit none
     
     contains
     
     ! Процедура для выключения считывания переменной delta_t
     module procedure scats_turn_read_delta_t_off
          
          gen_settings%read_delta_t = .false.
          
     end procedure scats_turn_read_delta_t_off
     
end submodule scats_turn_read_delta_t_off_s