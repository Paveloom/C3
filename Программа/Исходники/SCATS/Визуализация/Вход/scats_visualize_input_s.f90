submodule ( scats_visualize_m ) scats_visualize_input_s
implicit none
     
     contains
     
     ! Процедура для визуализации входных данных
     module procedure scats_visualize_input
          
          ! Проверка на наличие второго аргумента
          if ( present(output_file) ) then

               ! Вызов скрипта
               call execute_command_line('python Исходники/SCATS/Визуализация/Вход/scats_visualize_input_s.py '//input_file//' '//output_file)

          else

               ! Вызов скрипта
               call execute_command_line('python Исходники/SCATS/Визуализация/Вход/scats_visualize_input_s.py '//input_file)

          endif
          
     end procedure scats_visualize_input
     
end submodule scats_visualize_input_s