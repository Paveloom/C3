submodule ( scats_gen_settings_m ) scats_turn_read_phi_off_s
implicit none
     
     contains
     
     ! Процедура для выключения считывания переменной phi
     module procedure scats_turn_read_phi_off
          
          gen_settings%read_phi = .false.
          
     end procedure scats_turn_read_phi_off
     
end submodule scats_turn_read_phi_off_s