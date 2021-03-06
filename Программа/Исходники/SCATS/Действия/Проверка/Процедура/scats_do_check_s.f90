submodule ( scats_do_check_m ) scats_do_check_s
implicit none

     contains

     ! Процедура для проверки на совпадение форм входных данных и результата
     module procedure scats_do_check

          integer(IP) :: N ! Размер выборки
          integer(JP) :: N_m1_JP ! Размер выборки - 1 (индекс)

          integer(SP) :: stat ! Статусная переменная

          ! Проверка, выделены ли входные данные
          if ( .not. allocated(input%t) ) then; call scats_do_errors_log_error('NA_t', call_stat); return; endif
          if ( .not. allocated(input%x) ) then; call scats_do_errors_log_error('NA_x', call_stat); return; endif

          ! Определение размера выборки
          N = size(input%t, kind=IP)

          ! Конвертация
          N_m1_JP = int(N, kind=JP) - 1_JP

          if ( allocated(result%t) ) then

               if ( .not. size(result%t, kind=IP) .eq. N ) then

                    ! Освобождение памяти из-под массива времени
                    deallocate( result%t, stat = stat )
                    if ( stat .ne. 0_SP ) then; call scats_do_errors_log_error('WD_t', call_stat); return; endif

                    ! Выделение памяти под массив времени
                    allocate( result%t(0:N_m1_JP), stat = stat )
                    if ( stat .ne. 0_SP ) then; call scats_do_errors_log_error('WA_t', call_stat); return; endif

               endif

          else

               ! Выделение памяти под массив времени
               allocate( result%t(0:N_m1_JP), stat = stat )
               if ( stat .ne. 0_SP ) then; call scats_do_errors_log_error('WA_t', call_stat); return; endif

          endif

          if ( allocated(result%x) ) then

               if ( .not. size(result%x, kind=IP) .eq. N ) then

                    ! Освобождение памяти из-под массива значений
                    deallocate( result%x, stat = stat )
                    if ( stat .ne. 0_SP ) then; call scats_do_errors_log_error('WD_x', call_stat); return; endif

                    ! Выделение памяти под массив значений
                    allocate( result%x(0:N_m1_JP), stat = stat )
                    if ( stat .ne. 0_SP ) then; call scats_do_errors_log_error('WA_x', call_stat); return; endif

               endif

          else

               ! Выделение памяти под массив значений
               allocate( result%x(0:N_m1_JP), stat = stat )
               if ( stat .ne. 0_SP ) then; call scats_do_errors_log_error('WA_x', call_stat); return; endif

          endif

     end procedure scats_do_check

end submodule scats_do_check_s