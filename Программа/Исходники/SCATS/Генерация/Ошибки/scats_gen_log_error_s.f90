submodule ( scats_gen_m ) scats_gen_log_error_s
implicit none

     contains

     ! Процедура для вывода ошибок (генерация)
     module procedure scats_gen_log_error

          select case (error_code) ! Проверка кода ошибки

               case ('WA_t')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_log_error:', 'Не удалось выделить память под массив времени&
                                                                              & для объекта типа input_type.'
                    stop

               case ('WA_x')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_log_error:', 'Не удалось выделить память под массив значений&
                                                                              & для объекта типа input_type.'
                    stop

               case ('WD_t')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_log_error:', 'Не удалось освободить память из-под&
                                                                              & массива времени объекта&
                                                                              & типа input_type.'

               case ('WD_x')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_log_error:', 'Не удалось освободить память из-под&
                                                                              & массива значений объекта&
                                                                              & типа input_type.'

               case ('WA_rand')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_log_error:', 'Не удалось выделить память под массив случайных&
                                                                              & чисел внутри процедуры scats_gen_generate.'
                    stop

               case ('WD_rand')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_log_error:', 'Не удалось освободить память из-под&
                                                                              & массива случайных чисел внутри&
                                                                              & процедуры scats_gen_generate.'
                    stop

               case ('NA')

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_log_error:', 'Генератор не был активирован,&
                                                                              & генерация будет пропущена.'

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_gen_log_error:', 'Неизвестный код ошибки ('//error_code//').'

          end select

     end procedure scats_gen_log_error

end submodule scats_gen_log_error_s