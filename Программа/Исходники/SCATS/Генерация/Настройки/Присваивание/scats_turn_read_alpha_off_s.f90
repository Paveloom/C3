submodule ( scats_gen_settings_m ) scats_turn_read_alpha_off_s
implicit none
     
     contains
     
     ! Процедура для выключения считывания переменной alpha
     module procedure scats_turn_read_alpha_off
          
          gen_settings%read_alpha = .false.
          
     end procedure scats_turn_read_alpha_off
     
end submodule scats_turn_read_alpha_off_s