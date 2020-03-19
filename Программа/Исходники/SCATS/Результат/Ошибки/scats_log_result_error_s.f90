submodule ( scats_result_m ) scats_log_result_error_s
implicit none
     
     contains
     
     ! Процедура для вывода ошибок для других процедур, связанных с результатом
     module procedure scats_log_result_error
          
          select case (error_code) ! Проверка кода ошибки

               case ('WD_t') ! Встречается в scats_result_deallocate_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_result_error:', 'Не удалось освободить память из-под&
                                                                                & массива времени объекта&
                                                                                & типа result_type.'

               case ('WD_x') ! Встречается в scats_result_deallocate_s

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_result_error:', 'Не удалось освободить память из-под&
                                                                                & массива значений объекта&
                                                                                & типа result_type.'

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_log_result_error:', 'Неизвестный код ошибки ('//error_code//').'

          end select
          
     end procedure scats_log_result_error
     
end submodule scats_log_result_error_s