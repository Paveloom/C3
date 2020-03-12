submodule ( scats_gen_settings_m ) scats_turn_read_alpha_on_s
implicit none
     
     contains
     
     ! Процедура для включения считывания переменной alpha
     module procedure scats_turn_read_alpha_on
          
          gen_settings%read_alpha = .true.
          
     end procedure scats_turn_read_alpha_on
     
end submodule scats_turn_read_alpha_on_s