submodule ( scats_gen_settings_m ) scats_gen_settings_log_error_s
implicit none

     contains

     ! Процедура для вывода ошибок (настройки считывания параметров)
     module procedure scats_gen_settings_log_error

          select case (error_code) ! Проверка кода ошибки

               case ('WO')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_settings_log_error:', 'Не удалось открыть файл '//file//'&
                                                                                       & для чтения.'
                    call_stat = .true.

               case ('WR_read_delta_t')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_settings_log_error:', 'Не удалось считать ответ на вопрос о считывании&
                                                                                       & шага выборки в файле '//file//'.&
                                                                                       & Проверьте правильность введенных данных.'
                    call_stat = .true.

               case ('WR_read_q')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_settings_log_error:', 'Не удалось считать ответ на вопрос о считывании&
                                                                                       & уровня значимости в файле '//file//'.&
                                                                                       & Проверьте правильность введенных данных.'
                    call_stat = .true.

               case ('WR_read_alpha')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_settings_log_error:', 'Не удалось считать ответ на вопрос о считывании&
                                                                                       & параметра \alpha линейного тренда в файле '//file//'.&
                                                                                       & Проверьте правильность введенных данных.'
                    call_stat = .true.

               case ('WR_read_beta')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_settings_log_error:', 'Не удалось считать ответ на вопрос о считывании&
                                                                                       & параметра \beta линейного тренда в файле '//file//'.&
                                                                                       & Проверьте правильность введенных данных.'
                    call_stat = .true.

               case ('WR_read_A')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_settings_log_error:', 'Не удалось считать ответ на вопрос о считывании&
                                                                                       & массива амплитуд в файле '//file//'.&
                                                                                       & Проверьте правильность введенных данных.'
                    call_stat = .true.

               case ('WR_read_v')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_settings_log_error:', 'Не удалось считать ответ на вопрос о считывании&
                                                                                       & массива частот в файле '//file//'.&
                                                                                       & Проверьте правильность введенных данных.'
                    call_stat = .true.

               case ('WR_read_phi')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_settings_log_error:', 'Не удалось считать ответ на вопрос о считывании&
                                                                                       & массива фазовых сдвигов в файле '//file//'.&
                                                                                       & Проверьте правильность введенных данных.'
                    call_stat = .true.

               case ('WR_read_gamma')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_settings_log_error:', 'Не удалось считать ответ на вопрос о считывании&
                                                                                       & отношения «сигнал к шуму» в файле '//file//'.&
                                                                                       & Проверьте правильность введенных данных.'
                    call_stat = .true.

               case ('WС')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_settings_log_error:', 'Не удалось закрыть файл '//file//'&
                                                                                       & для чтения.'
                    call_stat = .true.

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_settings_log_error:', 'Неизвестный код ошибки ('//error_code//').'

          end select

     end procedure scats_gen_settings_log_error

end submodule scats_gen_settings_log_error_s