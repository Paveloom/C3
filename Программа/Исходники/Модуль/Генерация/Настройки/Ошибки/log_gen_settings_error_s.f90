submodule ( gen_settings_m ) log_gen_settings_error_s
implicit none

     contains

     ! Процедура для вывода ошибок для других процедур, связанных с
     ! настройками считывания параметров для генерации временного ряда
     module procedure log_gen_settings_error
          
          select case (error_code) ! Проверка кода ошибки

               case ('WO') ! Встречается в read_gen_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_gen_settings_error:', 'Не удалось открыть файл '//file//'&
                                                                                 & для чтения.'
                    stop

               case ('WR_read_delta_t') ! Встречается в read_gen_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_gen_settings_error:', 'Не удалось считать ответ на вопрос о считывании&
                                                                                 & шага выборки в файле '//file//'.&
                                                                                 & Проверьте правильность введенных данных.'
                    stop

               case ('WR_read_q') ! Встречается в read_gen_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_gen_settings_error:', 'Не удалось считать ответ на вопрос о считывании&
                                                                                 & уровня значимости в файле '//file//'.&
                                                                                 & Проверьте правильность введенных данных.'
                    stop

               case ('WR_read_alpha') ! Встречается в read_gen_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_gen_settings_error:', 'Не удалось считать ответ на вопрос о считывании&
                                                                                 & параметра \alpha линейного тренда в файле '//file//'.&
                                                                                 & Проверьте правильность введенных данных.'
                    stop

               case ('WR_read_beta') ! Встречается в read_gen_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_gen_settings_error:', 'Не удалось считать ответ на вопрос о считывании&
                                                                                 & параметра \beta линейного тренда в файле '//file//'.&
                                                                                 & Проверьте правильность введенных данных.'
                    stop

               case ('WR_read_A') ! Встречается в read_gen_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_gen_settings_error:', 'Не удалось считать ответ на вопрос о считывании&
                                                                                 & массива амплитуд в файле '//file//'.&
                                                                                 & Проверьте правильность введенных данных.'
                    stop

               case ('WR_read_v') ! Встречается в read_gen_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_gen_settings_error:', 'Не удалось считать ответ на вопрос о считывании&
                                                                                 & массива частот в файле '//file//'.&
                                                                                 & Проверьте правильность введенных данных.'
                    stop

               case ('WR_read_phi') ! Встречается в read_gen_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_gen_settings_error:', 'Не удалось считать ответ на вопрос о считывании&
                                                                                 & массива фазовых сдвигов в файле '//file//'.&
                                                                                 & Проверьте правильность введенных данных.'
                    stop

               case ('WR_read_gamma') ! Встречается в read_gen_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_gen_settings_error:', 'Не удалось считать ответ на вопрос о считывании&
                                                                                 & отношения «сигнал к шуму» в файле '//file//'.&
                                                                                 & Проверьте правильность введенных данных.'
                    stop

               case ('WС') ! Встречается в read_gen_settings_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_gen_settings_error:', 'Не удалось закрыть файл '//file//'&
                                                                                 & для чтения.'
                    stop

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'log_gen_settings_error:', 'Неизвестный код ошибки ('//error_code//').'

          end select

     end procedure log_gen_settings_error

end submodule log_gen_settings_error_s