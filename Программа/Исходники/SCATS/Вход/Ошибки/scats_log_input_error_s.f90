submodule ( scats_input_m ) scats_log_input_error_s
implicit none
     
     contains
     
     ! Процедура для вывода ошибок для других процедур, связанных с входными данными
     module procedure scats_log_input_error
          
          select case (error_code) ! Проверка кода ошибки

               case ('WO') ! Встречается в scats_write_to_file_s и scats_input_read_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_input_error:', 'Не удалось получить доступ к файлу '//file//'&
                                                                                & для чтения или записи.'
                    stop

               case ('WR_t') ! Встречается в scats_input_read_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_input_error:', 'Не удалось считать значения массива времени в&
                                                                                & файле '//file//'. Проверьте правильность&
                                                                                & введенных данных.'
                    stop

               case ('WR_x') ! Встречается в scats_input_read_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_input_error:', 'Не удалось считать значения массива значений в&
                                                                                & файле '//file//'. Проверьте правильность&
                                                                                & введенных данных.'
                    stop

               case ('WD_t') ! Встречается в scats_input_deallocate_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_input_error:', 'Не удалось освободить память из-под&
                                                                                & массива времени объекта&
                                                                                & типа input_type.'

               case ('WD_x') ! Встречается в scats_input_deallocate_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_input_error:', 'Не удалось освободить память из-под&
                                                                                & массива значений объекта&
                                                                                & типа input_type.'

               case ('NA_t') ! Встречается в scats_input_write_to_file_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_input_error:', 'Массив времени не был размещен.&
                                                                                & Запись этого массива будет пропущена.'

               case ('NA_x') ! Встречается в scats_input_write_to_file_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_input_error:', 'Массив значений не был размещен.&
                                                                                & Запись этого массива будет пропущена.'

               case ('WС') ! Встречается в scats_input_write_to_file_s и scats_input_read_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_input_error:', 'Не удалось закрыть файл '//file//'&
                                                                                & для чтения или записи.'
                    stop

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_input_error:', 'Неизвестный код ошибки ('//error_code//').'

          end select
          
     end procedure scats_log_input_error
     
end submodule scats_log_input_error_s