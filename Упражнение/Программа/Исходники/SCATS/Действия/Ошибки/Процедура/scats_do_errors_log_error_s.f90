submodule ( scats_do_errors_m ) scats_do_errors_log_error_s
implicit none

     contains

     ! Процедура для вывода ошибок (действия)
     module procedure scats_do_errors_log_error

          select case (error_code) ! Проверка кода ошибки

               case ('WA_t')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Не удалось выделить память под массив времени&
                                                                                    & для объекта типа result_type.'
                    call_stat = .true.

               case ('WA_x')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Не удалось выделить память под массив значений&
                                                                                    & для объекта типа result_type.'
                    call_stat = .true.

               case ('WA_v')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Не удалось выделить память под массив частот периодограммы&
                                                                                    & для объекта типа result_type.'
                    call_stat = .true.

               case ('WA_D')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Не удалось выделить память под массив значений периодограммы&
                                                                                    & для объекта типа result_type.'
                    call_stat = .true.

               case ('WA_X_FFT')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Не удалось выделить память под массив&
                                                                                    & комплексных значений преобразования Фурье.'
                    call_stat = .true.

               case ('WA_X_FFT_ABS')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Не удалось выделить память под модуль&
                                                                                    & преобразованных значений.'
                    call_stat = .true.

               case ('WA_c')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Не удалось выделить память под массив&
                                                                                    & значений коррелограммы объекта типа result_type.'
                    call_stat = .true.

               case ('WA_cw')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Не удалось выделить память под массив&
                                                                                    & значений взвешенной коррелограммы объекта типа result_type.'
                    call_stat = .true.

               case ('WA_Dw')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Не удалось выделить память под массив&
                                                                                    & значений сглаженной периодограммы объекта типа result_type.'
                    call_stat = .true.

               case ('WD_t')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Не удалось освободить память из-под&
                                                                                    & массива времени объекта&
                                                                                    & типа result_type.'

               case ('WD_x')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Не удалось освободить память из-под&
                                                                                    & массива значений объекта&
                                                                                    & типа result_type.'

               case ('WD_v')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Не удалось освободить память из-под&
                                                                                    & массива частот периодограммы объекта&
                                                                                    & типа result_type.'

               case ('WD_D')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Не удалось освободить память из-под&
                                                                                     & массива значений периодограммы объекта&
                                                                                     & типа result_type.'

               case ('WD_X_FFT')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Не удалось освободить память из-под&
                                                                                    & массива комплексных значений преобразования Фурье.'

               case ('WD_X_FFT_ABS')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Не удалось освободить память из-под&
                                                                                    & модуля преобразованных значений.'

               case ('WD_c')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Не удалось освободить память из-под&
                                                                                    & массива значений коррелограммы объекта типа result_type.'

               case ('WD_cw')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Не удалось освободить память из-под&
                                                                                    & массива значений взвешенной коррелограммы объекта типа result_type.'

               case ('WD_Dw')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Не удалось освободить память из-под&
                                                                                    & массива значений сглаженной периодограммы объекта типа result_type.'

               case ('NA_t')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Массив времени не был размещен.&
                                                                                    & Выполнение процедуры невозможно.'
                    call_stat = .true.

               case ('NA_x')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Массив значений не был размещен.&
                                                                                    & Выполнение процедуры невозможно.'
                    call_stat = .true.

               case ('NA_v')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Массив частот периодограммы не был размещен.&
                                                                                    & Выполнение процедуры невозможно.'
                    call_stat = .true.

               case ('NA_c')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Массив значений коррелограммы не был размещен.&
                                                                                    & Выполнение процедуры невозможно.'
                    call_stat = .true.

               case ('NA_cw')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Массив значений сглаженной коррелограммы не был размещен.&
                                                                                    & Выполнение процедуры невозможно.'
                    call_stat = .true.

               case ('W_nfactor')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Недопустимое значение nfactor. Возможные значения:&
                                                                                    & 0.1 <= nfactor >= 1.0.'
                    call_stat = .true.

               case ('W_a')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Недопустимое значение a. Возможные значения:&
                                                                                    & 0 <= a >= 0.25.'
                    call_stat = .true.

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_do_errors_log_error:', 'Неизвестный код ошибки ('//error_code//').'

          end select

     end procedure scats_do_errors_log_error

end submodule scats_do_errors_log_error_s