submodule ( scats_visualize_m ) scats_visualize_input_s
implicit none

     contains

     ! Процедура для визуализации входных данных
     module procedure scats_visualize_input

          ! Аргументы для скрипта
          character(300) :: arg1, arg2, arg3

          ! Присваивание значений аргументам
          arg1 = input_file

          ! Проверка на наличие второго аргумента
          if ( present(output_file) ) then

               ! Проверка на наличие третьего аргумента
               if ( present(title) ) then

                    arg2 = output_file
                    arg3 = title

               else

                    arg2 = output_file
                    arg3 = '-0-'

               endif

          else

               ! Проверка на наличие третьего аргумента
               if ( present(title) ) then

                    arg2 = '-0-'
                    arg3 = title

               else

                    arg2 = '-0-'
                    arg3 = '-0-'

               endif

          endif

          ! Вызов скрипта
          call execute_command_line('python3 Исходники/SCATS/Визуализация/Вход/scats_visualize_input_s.py '//trim(arg1)//' '//trim(arg2)//" '"//trim(arg3)//"'")

     end procedure scats_visualize_input

end submodule scats_visualize_input_s