submodule ( scats_gen_settings_m ) scats_turn_read_A_on_s
implicit none
     
     contains
     
     ! Процедура для включения считывания переменной A
     module procedure scats_turn_read_A_on
          
          gen_settings%read_A = .true.
          
     end procedure scats_turn_read_A_on
     
end submodule scats_turn_read_A_on_s