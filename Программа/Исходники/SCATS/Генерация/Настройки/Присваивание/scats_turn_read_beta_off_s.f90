submodule ( scats_gen_settings_m ) scats_turn_read_beta_off_s
implicit none
     
     contains
     
     ! Процедура для выключения считывания переменной beta
     module procedure scats_turn_read_beta_off
          
          gen_settings%read_beta = .false.
          
     end procedure scats_turn_read_beta_off
     
end submodule scats_turn_read_beta_off_s