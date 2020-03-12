submodule ( scats_gen_settings_m ) scats_turn_read_N_on_s
implicit none
     
     contains
     
     ! Процедура для включения считывания переменной N
     module procedure scats_turn_read_N_on
          
          gen_settings%read_N = .true.
          
     end procedure scats_turn_read_N_on
     
end submodule scats_turn_read_N_on_s