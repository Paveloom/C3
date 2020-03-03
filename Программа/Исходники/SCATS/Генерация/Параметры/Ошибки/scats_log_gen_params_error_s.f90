submodule ( scats_gen_params_m ) scats_log_gen_params_error_s
implicit none

     contains

     ! Процедура для вывода ошибок для других процедур,
     ! связанных с параметрами для генерации временного ряда
     module procedure scats_log_gen_params_error
          
          select case (error_code) ! Проверка кода ошибки

               case ('WO') ! Встречается в scats_read_gen_params_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_gen_params_error:', 'Не удалось открыть файл '//file//'&
                                                                                     & для чтения.'
                    stop

               case ('WR_N') ! Встречается в scats_read_gen_params_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_gen_params_error:', 'Не удалось считать значение размера выборки в&
                                                                                     & файле '//file//'. Проверьте правильность&
                                                                                     & введенных данных.'
                    stop

               case ('WR_delta_t') ! Встречается в scats_read_gen_params_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_gen_params_error:', 'Не удалось считать значение шага выборки в&
                                                                                     & файле '//file//'. Проверьте правильность&
                                                                                     & введенных данных.'
                    stop

               case ('WR_q') ! Встречается в scats_read_gen_params_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_gen_params_error:', 'Не удалось считать значение уровня значимости в&
                                                                                     & файле '//file//'. Проверьте правильность&
                                                                                     & введенных данных.'
                    stop

               case ('WR_alpha') ! Встречается в scats_read_gen_params_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_gen_params_error:', 'Не удалось считать значение параметра alpha в&
                                                                                     & файле '//file//'. Проверьте правильность&
                                                                                     & введенных данных.'
                    stop

               case ('WR_beta') ! Встречается в scats_read_gen_params_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_gen_params_error:', 'Не удалось считать значение параметра beta в&
                                                                                     & файле '//file//'. Проверьте правильность&
                                                                                     & введенных данных.'
                    stop

               case ('WR_r') ! Встречается в scats_read_gen_params_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_gen_params_error:', 'Не удалось считать значение числа гармонических компонент в&
                                                                                     & файле '//file//'. Проверьте правильность&
                                                                                     & введенных данных.'
                    stop

               case ('WA_A') ! Встречается в scats_read_gen_params_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_gen_params_error:', 'Не удалось выделить память под массив амплитуд&
                                                                                     & для объекта типа gen_params_type.'
                    stop

               case ('WR_A') ! Встречается в scats_read_gen_params_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_gen_params_error:', 'Не удалось считать значения массива амплитуд в&
                                                                               & файле '//file//'. Проверьте правильность&
                                                                               & введенных данных.'
                    stop

               case ('WD_A') ! Встречается в scats_deallocate_gen_params_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_gen_params_error:', 'Не удалось освободить память из-под&
                                                                                     & массива амплитуд объекта&
                                                                                     & типа gen_params_type.'

               case ('WA_v') ! Встречается в scats_read_gen_params_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_gen_params_error:', 'Не удалось выделить память под массив частот&
                                                                                     & для объекта типа gen_params_type.'
                    stop

               case ('WR_v') ! Встречается в scats_read_gen_params_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_gen_params_error:', 'Не удалось считать значения массива частот в&
                                                                               & файле '//file//'. Проверьте правильность&
                                                                               & введенных данных.'
                    stop

               case ('WD_v') ! Встречается в scats_deallocate_gen_params_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_gen_params_error:', 'Не удалось освободить память из-под&
                                                                                     & массива частот объекта&
                                                                                     & типа gen_params_type.'

               case ('WA_phi') ! Встречается в scats_read_gen_params_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_gen_params_error:', 'Не удалось выделить память под массив фазовых сдвигов&
                                                                                     & для объекта типа gen_params_type.'
                    stop

               case ('WR_phi') ! Встречается в scats_read_gen_params_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_gen_params_error:', 'Не удалось считать значения массива фазовых сдвигов в&
                                                                                     & файле '//file//'. Проверьте правильность&
                                                                                     & введенных данных.'
                    stop

               case ('WD_phi') ! Встречается в scats_deallocate_gen_params_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_gen_params_error:', 'Не удалось освободить память из-под&
                                                                                     & массива фазовых сдвигов объекта&
                                                                                     & типа gen_params_type.'

               case ('WR_gamma') ! Встречается в scats_read_gen_params_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_gen_params_error:', 'Не удалось считать значение отношения «сигнал к шуму» в&
                                                                                     & файле '//file//'. Проверьте правильность&
                                                                                     & введенных данных.'
                    stop

               case ('WС') ! Встречается в scats_scats_read_gen_params_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_gen_params_error:', 'Не удалось закрыть файл '//file//'&
                                                                                     & для чтения.'
                    stop

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_gen_params_error:', 'Неизвестный код ошибки ('//error_code//').'

          end select

     end procedure scats_log_gen_params_error

end submodule scats_log_gen_params_error_s