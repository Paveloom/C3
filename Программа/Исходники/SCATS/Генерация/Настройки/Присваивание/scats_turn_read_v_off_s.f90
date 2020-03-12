submodule ( scats_gen_settings_m ) scats_turn_read_v_off_s
implicit none
     
     contains
     
     ! Процедура для выключения считывания переменной v
     module procedure scats_turn_read_v_off
          
          gen_settings%read_v = .false.
          
     end procedure scats_turn_read_v_off
     
end submodule scats_turn_read_v_off_s