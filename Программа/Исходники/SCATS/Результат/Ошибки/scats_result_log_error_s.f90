submodule ( scats_result_m ) scats_result_log_error_s
implicit none

     contains

     ! Процедура для вывода ошибок (результат)
     module procedure scats_result_log_error

          select case (error_code) ! Проверка кода ошибки

               case ('WO')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_result_log_error:', 'Не удалось получить доступ к файлу '//file//'&
                                                                                 & для записи.'
                    stop

               case ('WD_t')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_result_log_error:', 'Не удалось освободить память из-под&
                                                                                 & массива времени объекта&
                                                                                 & типа result_type.'

               case ('WD_x')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_result_log_error:', 'Не удалось освободить память из-под&
                                                                                 & массива значений объекта&
                                                                                 & типа result_type.'

               case ('WD_X_FFT_ABS')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_result_log_error:', 'Не удалось освободить память из-под&
                                                                                 & модуля преобразованных значений объекта&
                                                                                 & типа result_type.'

               case ('WD_v')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_result_log_error:', 'Не удалось освободить память из-под&
                                                                                 & массива частот периодограммы объекта&
                                                                                 & типа result_type.'

               case ('WD_D')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_result_log_error:', 'Не удалось освободить память из-под&
                                                                                 & массива значений периодограммы объекта&
                                                                                 & типа result_type.'

               case ('WD_c')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_result_log_error:', 'Не удалось освободить память из-под&
                                                                                 & массива значений коррелограммы объекта&
                                                                                 & типа result_type.'

               case ('WD_cw')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_result_log_error:', 'Не удалось освободить память из-под&
                                                                                 & массива значений взвешенной коррелограммы объекта&
                                                                                 & типа result_type.'

               case ('WD_Dw')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_result_log_error:', 'Не удалось освободить память из-под&
                                                                                 & массива значений сглаженной периодограммы объекта&
                                                                                 & типа result_type.'

               case ('NA_t')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_result_log_error:', 'Массив времени не был размещен.&
                                                                                 & Запись невозможна.'
                    stop

               case ('NA_x')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_result_log_error:', 'Массив значений не был размещен.&
                                                                                 & Запись невозможна.'
                    stop

               case ('WС')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_result_log_error:', 'Не удалось закрыть файл '//file//'&
                                                                                 & после записи.'
                    stop

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_result_log_error:', 'Неизвестный код ошибки ('//error_code//').'

          end select

     end procedure scats_result_log_error

end submodule scats_result_log_error_s