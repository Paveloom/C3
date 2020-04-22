submodule ( scats_gen_params_m ) scats_gen_params_log_error_s
implicit none

     contains

     ! Процедура для вывода ошибок (параметры генерации временного ряда)
     module procedure scats_gen_params_log_error

          select case (error_code) ! Проверка кода ошибки

               case ('WO')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Не удалось открыть файл '//file//'&
                                                                                     & для чтения.'
                    call gen_params%deallocate()
                    stop

               case ('WR_N')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Не удалось считать значение размера выборки в&
                                                                                     & файле '//file//'. Проверьте правильность&
                                                                                     & введенных данных.'
                    call gen_params%deallocate()
                    stop

               case ('WR_delta_t')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Не удалось считать значение шага выборки в&
                                                                                     & файле '//file//'. Проверьте правильность&
                                                                                     & введенных данных.'
                    call gen_params%deallocate()
                    stop

               case ('WR_q')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Не удалось считать значение уровня значимости в&
                                                                                     & файле '//file//'. Проверьте правильность&
                                                                                     & введенных данных.'
                    call gen_params%deallocate()
                    stop

               case ('WR_alpha')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Не удалось считать значение параметра alpha в&
                                                                                     & файле '//file//'. Проверьте правильность&
                                                                                     & введенных данных.'
                    call gen_params%deallocate()
                    stop

               case ('WR_beta')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Не удалось считать значение параметра beta в&
                                                                                     & файле '//file//'. Проверьте правильность&
                                                                                     & введенных данных.'
                    call gen_params%deallocate()
                    stop

               case ('WR_r')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Не удалось считать значение числа гармонических компонент в&
                                                                                     & файле '//file//'. Проверьте правильность&
                                                                                     & введенных данных.'
                    call gen_params%deallocate()
                    stop

               case ('WA_A')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Не удалось выделить память под массив амплитуд&
                                                                                     & для объекта типа gen_params_type.'
                    call gen_params%deallocate()
                    stop

               case ('WR_A')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Не удалось считать значения массива амплитуд в&
                                                                                     & файле '//file//'. Проверьте правильность&
                                                                                     & введенных данных.'
                    call gen_params%deallocate()
                    stop

               case ('WD_A')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Не удалось освободить память из-под&
                                                                                     & массива амплитуд объекта&
                                                                                     & типа gen_params_type.'

               case ('WA_v')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Не удалось выделить память под массив частот&
                                                                                     & для объекта типа gen_params_type.'
                    call gen_params%deallocate()
                    stop

               case ('WR_v')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Не удалось считать значения массива частот в&
                                                                                     & файле '//file//'. Проверьте правильность&
                                                                                     & введенных данных.'
                    call gen_params%deallocate()
                    stop

               case ('WD_v')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Не удалось освободить память из-под&
                                                                                     & массива частот объекта&
                                                                                     & типа gen_params_type.'

               case ('WA_phi')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Не удалось выделить память под массив фазовых сдвигов&
                                                                                     & для объекта типа gen_params_type.'
                    call gen_params%deallocate()
                    stop

               case ('WR_phi')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Не удалось считать значения массива фазовых сдвигов в&
                                                                                     & файле '//file//'. Проверьте правильность&
                                                                                     & введенных данных.'
                    call gen_params%deallocate()
                    stop

               case ('WD_phi')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Не удалось освободить память из-под&
                                                                                     & массива фазовых сдвигов объекта&
                                                                                     & типа gen_params_type.'

               case ('WR_gamma')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Не удалось считать значение отношения «сигнал к шуму» в&
                                                                                     & файле '//file//'. Проверьте правильность&
                                                                                     & введенных данных.'
                    call gen_params%deallocate()
                    stop

               case ('WС')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Не удалось закрыть файл '//file//'&
                                                                                     & для чтения.'
                    call gen_params%deallocate()
                    stop

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_params_log_error:', 'Неизвестный код ошибки ('//error_code//').'

          end select

     end procedure scats_gen_params_log_error

end submodule scats_gen_params_log_error_s