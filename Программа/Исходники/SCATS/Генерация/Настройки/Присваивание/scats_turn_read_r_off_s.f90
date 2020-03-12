submodule ( scats_gen_settings_m ) scats_turn_read_r_off_s
implicit none
     
     contains
     
     ! Процедура для выключения считывания переменной r
     module procedure scats_turn_read_r_off
          
          gen_settings%read_r = .false.
          
     end procedure scats_turn_read_r_off
     
end submodule scats_turn_read_r_off_s