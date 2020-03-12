submodule ( scats_gen_settings_m ) scats_turn_read_N_off_s
implicit none
     
     contains
     
     ! Процедура для выключения считывания переменной N
     module procedure scats_turn_read_N_off
          
          gen_settings%read_N = .false.
          
     end procedure scats_turn_read_N_off
     
end submodule scats_turn_read_N_off_s