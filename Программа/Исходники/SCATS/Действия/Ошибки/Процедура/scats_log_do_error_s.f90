submodule ( scats_do_errors_m ) scats_log_do_error_s
implicit none
     
     contains
     
     ! Процедура для вывода ошибок
     module procedure scats_log_do_error
          
          select case (error_code) ! Проверка кода ошибки

               case ('WA_t') 

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_do_error:', 'Не удалось выделить память под массив времени&
                                                                             & для объекта типа result_type.'
                    stop

               case ('WA_x')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_do_error:', 'Не удалось выделить память под массив значений&
                                                                             & для объекта типа result_type.'
                    stop

               case ('WA_v')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_do_error:', 'Не удалось выделить память под массив частот периодограммы&
                                                                             & для объекта типа result_type.'
                    stop

               case ('WA_D')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_do_error:', 'Не удалось выделить память под массив значений периодограммы&
                                                                             & для объекта типа result_type.'
                    stop

               case ('WA_X')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_do_error:', 'Не удалось выделить память под массив&
                                                                             & комплексных значений преобразования Фурье.'
                    stop

               case ('WA_Nx')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_do_error:', 'Не удалось выделить память под массив новых значений&
                                                                             & при выполнении действия.'
                    stop

               case ('WD_t') 

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_do_error:', 'Не удалось освободить память из-под&
                                                                             & массива времени объекта&
                                                                             & типа result_type.'

               case ('WD_x') 

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_do_error:', 'Не удалось освободить память из-под&
                                                                             & массива значений объекта&
                                                                             & типа result_type.'

               case ('WD_v') 

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_do_error:', 'Не удалось освободить память из-под&
                                                                             & массива частот периодограммы объекта&
                                                                             & типа result_type.'

               case ('WD_D') 

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_do_error:', 'Не удалось освободить память из-под&
                                                                             & массива значений периодограммы объекта&
                                                                             & типа result_type.'

               case ('WD_X') 

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_do_error:', 'Не удалось освободить память из-под&
                                                                             & массива комплексных значений преобразования Фурье.'

               case ('WD_Nx') 

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_do_error:', 'Не удалось освободить память из-под&
                                                                             & массива новых значений при&
                                                                             & выполнении действия.'

               case ('NA_t') 

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_do_error:', 'Массив времени не был размещен во входных данных.&
                                                                             & Выполнение процедуры невозможно.'
                    stop

               case ('NA_x') 

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_do_error:', 'Массив значений не был размещен во входных данных.&
                                                                             & Выполнение процедуры невозможно.'
                    stop

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_do_error:', 'Неизвестный код ошибки ('//error_code//').'

          end select
          
     end procedure scats_log_do_error
     
end submodule scats_log_do_error_s