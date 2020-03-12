submodule ( scats_gen_settings_m ) scats_turn_read_phi_on_s
implicit none
     
     contains
     
     ! Процедура для включения считывания переменной phi
     module procedure scats_turn_read_phi_on
          
          gen_settings%read_phi = .true.
          
     end procedure scats_turn_read_phi_on
     
end submodule scats_turn_read_phi_on_s