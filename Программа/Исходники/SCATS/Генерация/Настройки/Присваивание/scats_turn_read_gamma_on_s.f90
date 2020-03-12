submodule ( scats_gen_settings_m ) scats_turn_read_gamma_on_s
implicit none
     
     contains
     
     ! Процедура для включения считывания переменной gamma
     module procedure scats_turn_read_gamma_on
          
          gen_settings%read_gamma = .true.
          
     end procedure scats_turn_read_gamma_on
     
end submodule scats_turn_read_gamma_on_s