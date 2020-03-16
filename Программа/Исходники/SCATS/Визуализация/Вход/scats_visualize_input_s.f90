submodule ( scats_visualize_m ) scats_visualize_input_s
implicit none
     
     contains
     
     ! Процедура для визуализации входных данных
     module procedure scats_visualize_input
          
          ! Вызов скрипта
          call execute_command_line('python Исходники/SCATS/Визуализация/Вход/scats_visualize_input_s.py')
          
     end procedure scats_visualize_input
     
end submodule scats_visualize_input_s