submodule ( scats_gen_settings_m ) scats_turn_read_r_on_s
implicit none
     
     contains
     
     ! Процедура для включения считывания переменной r
     module procedure scats_turn_read_r_on
          
          gen_settings%read_r = .true.
          
     end procedure scats_turn_read_r_on
     
end submodule scats_turn_read_r_on_s