submodule ( scats_gen_settings_m ) scats_turn_read_q_off_s
implicit none
     
     contains
     
     ! Процедура для выключения считывания переменной q
     module procedure scats_turn_read_q_off
          
          gen_settings%read_q = .false.
          
     end procedure scats_turn_read_q_off
     
end submodule scats_turn_read_q_off_s