submodule ( scats_gen_settings_m ) scats_turn_read_A_off_s
implicit none
     
     contains
     
     ! Процедура для выключения считывания переменной A
     module procedure scats_turn_read_A_off
          
          gen_settings%read_A = .false.
          
     end procedure scats_turn_read_A_off
     
end submodule scats_turn_read_A_off_s