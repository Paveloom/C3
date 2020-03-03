submodule ( gen_settings_m ) get_read_phi_pt_s
implicit none
     
     contains
     
     ! Функция для получения указателя 
     ! на значение переменной read_phi
     module procedure get_read_phi_pt
          
          read_phi_pt => gen_settings%read_phi
          
     end procedure get_read_phi_pt
     
end submodule get_read_phi_pt_s