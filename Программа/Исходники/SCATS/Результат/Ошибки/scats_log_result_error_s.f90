submodule ( scats_result_m ) scats_log_result_error_s
implicit none
     
     contains
     
     ! Процедура для вывода ошибок для других процедур, связанных с результатом
     module procedure scats_log_result_error
          
          select case (error_code) ! Проверка кода ошибки

               case ('WO') ! Встречается в scats_result_write_to_file_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_result_error:', 'Не удалось получить доступ к файлу '//file//'&
                                                                                 & для записи.'
                    stop

               case ('WD_t') ! Встречается в scats_result_deallocate_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_result_error:', 'Не удалось освободить память из-под&
                                                                                 & массива времени объекта&
                                                                                 & типа result_type.'

               case ('WD_x') ! Встречается в scats_result_deallocate_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_result_error:', 'Не удалось освободить память из-под&
                                                                                 & массива значений объекта&
                                                                                 & типа result_type.'

               case ('WD_X_FFT_ABS') ! Встречается в scats_result_deallocate_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_result_error:', 'Не удалось освободить память из-под&
                                                                                 & модуля преобразованных значений объекта&
                                                                                 & типа result_type.'

               case ('WD_v') ! Встречается в scats_result_deallocate_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_result_error:', 'Не удалось освободить память из-под&
                                                                                 & массива частот периодограммы объекта&
                                                                                 & типа result_type.'

               case ('WD_D') ! Встречается в scats_result_deallocate_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_result_error:', 'Не удалось освободить память из-под&
                                                                                 & массива значений периодограммы объекта&
                                                                                 & типа result_type.'

               case ('WD_c') ! Встречается в scats_result_deallocate_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_result_error:', 'Не удалось освободить память из-под&
                                                                                 & массива значений коррелограммы объекта&
                                                                                 & типа result_type.'

               case ('WD_cw') ! Встречается в scats_result_deallocate_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_result_error:', 'Не удалось освободить память из-под&
                                                                                 & массива значений взвешенной коррелограммы объекта&
                                                                                 & типа result_type.'

               case ('WD_Dw') ! Встречается в scats_result_deallocate_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_result_error:', 'Не удалось освободить память из-под&
                                                                                 & массива значений сглаженной периодограммы объекта&
                                                                                 & типа result_type.'

               case ('NA_t') ! Встречается в scats_result_write_to_file_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_result_error:', 'Массив времени не был размещен.&
                                                                                 & Запись невозможна.'
                    stop

               case ('NA_x') ! Встречается в scats_result_write_to_file_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_result_error:', 'Массив значений не был размещен.&
                                                                                 & Запись невозможна.'
                    stop

               case ('WС') ! Встречается в scats_result_write_to_file_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_result_error:', 'Не удалось закрыть файл '//file//'&
                                                                                 & после записи.'
                    stop

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_result_error:', 'Неизвестный код ошибки ('//error_code//').'

          end select
          
     end procedure scats_log_result_error
     
end submodule scats_log_result_error_s