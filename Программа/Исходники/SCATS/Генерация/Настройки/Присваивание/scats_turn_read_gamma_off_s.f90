submodule ( scats_gen_settings_m ) scats_turn_read_gamma_off_s
implicit none
     
     contains
     
     ! Процедура для выключения считывания переменной gamma
     module procedure scats_turn_read_gamma_off
          
          gen_settings%read_gamma = .false.
          
     end procedure scats_turn_read_gamma_off
     
end submodule scats_turn_read_gamma_off_s