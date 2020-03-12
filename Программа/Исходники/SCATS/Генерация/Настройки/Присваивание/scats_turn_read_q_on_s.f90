submodule ( scats_gen_settings_m ) scats_turn_read_q_on_s
implicit none
     
     contains
     
     ! Процедура для включения считывания переменной q
     module procedure scats_turn_read_q_on
          
          gen_settings%read_q = .true.
          
     end procedure scats_turn_read_q_on
     
end submodule scats_turn_read_q_on_s