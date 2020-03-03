submodule ( scats_gen_settings_m ) scats_get_read_phi_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_phi
     module procedure scats_get_read_phi_pt
          
          read_phi_pt => gen_settings%read_phi
          
     end procedure scats_get_read_phi_pt
     
end submodule scats_get_read_phi_pt_s