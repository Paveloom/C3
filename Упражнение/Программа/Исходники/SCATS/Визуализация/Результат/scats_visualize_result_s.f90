submodule ( scats_visualize_m ) scats_visualize_result_s
implicit none

     contains

     ! Процедура для визуализации входных данных
     module procedure scats_visualize_result

          ! Аргументы для скрипта
          character(300) :: arg1, arg2, arg3, arg4, arg5, arg6

          ! Проверка на разрешенные этапы
          if ( .not. (stage .eq. 'data' .or. stage .eq. 'per' .or. stage .eq. 'corr' .or. stage .eq. 'w_per') ) then

               write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_visualize_result:', 'Указан недопустимый этап в переменной stage,&
                                                                            & визуализация невозможна. Допустимые значения:&
                                                                            & data, per, corr, w_per.'
               stop

          endif

          ! Присваивание значений аргументам
          arg1 = input_file
          arg2 = stage

          ! Проверка на наличие третьего аргумента
          if ( present(output_file) ) then

               ! Проверка на наличие четвертого аргумента
               if ( present(title) ) then

                    ! Проверка на наличие пятого аргумента
                    if ( present(xlim) ) then

                         ! Проверка на наличие шестого аргумента
                         if ( present(ylim) ) then

                              arg3 = output_file
                              arg4 = title
                              arg5 = xlim
                              arg6 = ylim

                         else

                              arg3 = output_file
                              arg4 = title
                              arg5 = xlim
                              arg6 = '-0-'

                         endif

                    else

                         ! Проверка на наличие шестого аргумента
                         if ( present(ylim) ) then

                              arg3 = output_file
                              arg4 = title
                              arg5 = '-0-'
                              arg6 = ylim

                         else

                              arg3 = output_file
                              arg4 = title
                              arg5 = '-0-'
                              arg6 = '-0-'

                         endif

                    endif

               else

                    ! Проверка на наличие пятого аргумента
                    if ( present(xlim) ) then

                         ! Проверка на наличие шестого аргумента
                         if ( present(ylim) ) then

                              arg3 = output_file
                              arg4 = '-0-'
                              arg5 = xlim
                              arg6 = ylim

                         else

                              arg3 = output_file
                              arg4 = '-0-'
                              arg5 = xlim
                              arg6 = '-0-'

                         endif

                    else

                         ! Проверка на наличие шестого аргумента
                         if ( present(ylim) ) then

                              arg3 = output_file
                              arg4 = '-0-'
                              arg5 = '-0-'
                              arg6 = ylim

                         else

                              arg3 = output_file
                              arg4 = '-0-'
                              arg5 = '-0-'
                              arg6 = '-0-'

                         endif

                    endif

               endif

          else

               ! Проверка на наличие четвертого аргумента
               if ( present(title) ) then

                    ! Проверка на наличие пятого аргумента
                    if ( present(xlim) ) then

                         ! Проверка на наличие шестого аргумента
                         if ( present(ylim) ) then

                              arg3 = '-0-'
                              arg4 = title
                              arg5 = xlim
                              arg6 = ylim

                         else

                              arg3 = '-0-'
                              arg4 = title
                              arg5 = xlim
                              arg6 = '-0-'

                         endif

                    else

                         ! Проверка на наличие шестого аргумента
                         if ( present(ylim) ) then

                              arg3 = '-0-'
                              arg4 = title
                              arg5 = '-0-'
                              arg6 = ylim

                         else

                              arg3 = '-0-'
                              arg4 = title
                              arg5 = '-0-'
                              arg6 = '-0-'

                         endif

                    endif

               else

                    ! Проверка на наличие пятого аргумента
                    if ( present(xlim) ) then

                         ! Проверка на наличие шестого аргумента
                         if ( present(ylim) ) then

                              arg3 = '-0-'
                              arg4 = '-0-'
                              arg5 = xlim
                              arg6 = ylim

                         else

                              arg3 = '-0-'
                              arg4 = '-0-'
                              arg5 = xlim
                              arg6 = '-0-'

                         endif

                    else

                         ! Проверка на наличие шестого аргумента
                         if ( present(ylim) ) then

                              arg3 = '-0-'
                              arg4 = '-0-'
                              arg5 = '-0-'
                              arg6 = ylim

                         else

                              arg3 = '-0-'
                              arg4 = '-0-'
                              arg5 = '-0-'
                              arg6 = '-0-'

                         endif

                    endif

               endif

          endif

          ! Вызов скрипта
          call execute_command_line('python3 Исходники/SCATS/Визуализация/Результат/scats_visualize_result_s.py '&
                                   &//trim(arg1)//' '//trim(arg2)//' '//trim(arg3)//" '"//trim(arg4)//"' '"//trim(arg5)//"' '"//trim(arg6)//"'")

     end procedure scats_visualize_result

end submodule scats_visualize_result_s