submodule ( scats_gen_settings_m ) scats_turn_read_v_on_s
implicit none
     
     contains
     
     ! Процедура для включения считывания переменной v
     module procedure scats_turn_read_v_on
          
          gen_settings%read_v = .true.
          
     end procedure scats_turn_read_v_on
     
end submodule scats_turn_read_v_on_s