submodule ( scats_visualize_m ) scats_visualize_input_s
implicit none
     
     contains
     
     ! Процедура для визуализации входных данных
     module procedure scats_visualize_input
          
          ! Проверка на наличие второго аргумента
          if ( present(output_file) ) then

               ! Проверка на наличие третьего аргумента
               if ( present(title) ) then

                    ! Вызов скрипта
                    call execute_command_line('python Исходники/SCATS/Визуализация/Вход/scats_visualize_input_s.py '//input_file//' '//output_file//" '"//title//"'")

               else

                    ! Вызов скрипта
                    call execute_command_line('python Исходники/SCATS/Визуализация/Вход/scats_visualize_input_s.py '//input_file//' '//output_file//' '//'-0-')

               endif

          else

               ! Проверка на наличие третьего аргумента
               if ( present(title) ) then

                    ! Вызов скрипта
                    call execute_command_line('python Исходники/SCATS/Визуализация/Вход/scats_visualize_input_s.py '//input_file//' '//'-0-'//" '"//title//"'")

               else

                    ! Вызов скрипта
                    call execute_command_line('python Исходники/SCATS/Визуализация/Вход/scats_visualize_input_s.py '//input_file//' '//'-0-'//' '//'-0-')

               endif

          endif
          
     end procedure scats_visualize_input
     
end submodule scats_visualize_input_s