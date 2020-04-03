submodule ( scats_visualize_m ) scats_visualize_result_s
implicit none

     contains

     ! Процедура для визуализации входных данных
     module procedure scats_visualize_result

          ! Аргументы для скрипта
          character(300) :: arg1, arg2, arg3, arg4, arg5, arg6
          character(5) :: arg7

          ! Проверка на разрешенные этапы
          if ( .not. (stage .eq. 'data' .or. stage .eq. 'per' .or. stage .eq. 'corr' .or. stage .eq. 'w_per') ) then

               write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_visualize_result:', 'Указан недопустимый этап в переменной stage,&
                                                                            & визуализация невозможна. Допустимые значения:&
                                                                            & data, per, corr, w_per.'
               stop

          endif

          ! Проверка на неуместное использование show_sigma
          if ( present(show_sigma) .and. ( stage .ne. "per" )) then

               write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_visualize_result:', 'Флаг show_sigma не может быть использован, если&
                                                                            & аргументу stage не передано значение ''per''.'
               stop

          endif

          ! Присваивание значений аргументам
          arg1 = input_file
          arg2 = stage

          ! Проверка на наличие третьего аргумента
          if ( present(output_file) ) then

               arg3 = output_file

          else

               arg3 = "-0-"

          endif

          ! Проверка на наличие четвертого аргумента
          if ( present(title) ) then

               arg4 = title

          else

               arg4 = "-0-"

          endif

          ! Проверка на наличие пятого аргумента
          if ( present(xlim) ) then

               arg5 = xlim

          else

               arg5 = "-0-"

          endif

          ! Проверка на наличие шестого аргумента
          if ( present(ylim) ) then

               arg6 = ylim

          else

               arg6 = "-0-"

          endif

          ! Проверка на наличие седьмого аргумента
          if ( present(show_sigma) ) then

               ! Проверка значения show_sigma
               if ( show_sigma ) then

                    arg7 = "True"

               else

                    arg7 = "False"

               endif

          else

               arg7 = "True"

          endif

          ! Вызов скрипта
          call execute_command_line('python3 Исходники/SCATS/Визуализация/Результат/scats_visualize_result_s.py '&
                                   &//trim(arg1)//' '//trim(arg2)//' '//trim(arg3)//" '"//trim(arg4)//"' '"//trim(arg5)//"' '"//trim(arg6)//"' "//trim(arg7))

     end procedure scats_visualize_result

end submodule scats_visualize_result_s