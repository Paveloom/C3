submodule ( scats_input_m ) scats_input_log_error_s
implicit none

     contains

     ! Процедура для вывода ошибок (входные данные)
     module procedure scats_input_log_error

          select case (error_code) ! Проверка кода ошибки

               case ('WO')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_input_log_error:', 'Не удалось получить доступ к файлу '//file//'&
                                                                                & для чтения или записи.'
                    call_stat = .true.

               case ('WR_N')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_input_log_error:', 'Не удалось считать значение размера выборки в&
                                                                                & файле '//file//'. Проверьте правильность&
                                                                                & введенных данных.'
                    call_stat = .true.

               case ('WR_delta_t')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_input_log_error:', 'Не удалось считать значение шага выборки в&
                                                                                & файле '//file//'. Проверьте правильность&
                                                                                & введенных данных.'
                    call_stat = .true.

               case ('WR_q')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_input_log_error:', 'Не удалось считать значение уровня значимости в&
                                                                                & файле '//file//'. Проверьте правильность&
                                                                                & введенных данных.'
                    call_stat = .true.

               case ('WR_t')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_input_log_error:', 'Не удалось считать значения массива времени в&
                                                                                & файле '//file//'. Проверьте правильность&
                                                                                & введенных данных.'
                    call_stat = .true.

               case ('WR_x')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_input_log_error:', 'Не удалось считать значения массива значений в&
                                                                                & файле '//file//'. Проверьте правильность&
                                                                                & введенных данных.'
                    call_stat = .true.

               case ('WA_t')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_input_log_error:', 'Не удалось выделить память под массив времени&
                                                                                & для объекта типа input_type.'
                    call_stat = .true.

               case ('WA_x')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_input_log_error:', 'Не удалось выделить память под массив значений&
                                                                                & для объекта типа input_type.'
                    call_stat = .true.

               case ('WD_t')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_input_log_error:', 'Не удалось освободить память из-под&
                                                                                & массива времени объекта&
                                                                                & типа input_type.'

               case ('WD_x')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_input_log_error:', 'Не удалось освободить память из-под&
                                                                                & массива значений объекта&
                                                                                & типа input_type.'

               case ('NA_t')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_input_log_error:', 'Массив времени не был размещен.&
                                                                                & Запись невозможна.'
                    call_stat = .true.

               case ('NA_x')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_input_log_error:', 'Массив значений не был размещен.&
                                                                                & Запись невозможна.'
                    call_stat = .true.

               case ('WС')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_input_log_error:', 'Не удалось закрыть файл '//file//'&
                                                                                & для чтения или записи.'
                    call_stat = .true.

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_input_log_error:', 'Неизвестный код ошибки ('//error_code//').'

          end select

     end procedure scats_input_log_error

end submodule scats_input_log_error_s