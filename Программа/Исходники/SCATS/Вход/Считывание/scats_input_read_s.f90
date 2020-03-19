submodule ( scats_input_m ) scats_input_read_s
implicit none
     
     contains
     
     ! Процедура для считывания входных данных
     module procedure scats_input_read
          
          integer(SP) :: stat ! Статусная переменная
          integer(UP) :: unit ! Номер дескриптора файла

          integer(IP) :: N ! Размер выборки
          integer(JP) :: N_m1 ! Размер выборки - 1

          ! Открытие файла
          open( newunit = unit, file = file, action = 'read', status = 'old', iostat = stat)
          if ( stat .ne. 0_SP ) call scats_log_input_error('WO', file) ! Проверка на ошибку открытия файла
          
          ! Пропуск строки
          read( unit = unit, fmt = '()' )

          ! Считывание размера выборки
          read( unit = unit, fmt = *, iostat = stat ) N
          if ( stat .ne. 0_SP ) call scats_log_input_error('WR_N', file)

          ! Конвертация
          N_m1 = int(N, kind = JP) - 1_JP

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Выполнение считывания
          
          if ( allocated(input%t) ) then

               if ( size(input%t, kind=IP) .eq. N ) then

                    ! Считывание массива времени
                    read( unit = unit, fmt = *, iostat = stat ) input%t
                    if ( stat .ne. 0_SP ) call scats_log_input_error('WR_t', file)

               else

                    ! Освобождение памяти из-под массива времени
                    deallocate( input%t, stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_input_error('WD_t')

                    ! Выделение памяти под массив времени
                    allocate( input%t(0:N_m1), stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_input_error('WA_t')

                    ! Считывание массива времени
                    read( unit = unit, fmt = *, iostat = stat ) input%t
                    if ( stat .ne. 0_SP ) call scats_log_input_error('WR_t', file)

               endif

          else

               ! Выделение памяти под массив времени
               allocate( input%t(0:N_m1), stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_input_error('WA_t')

               ! Считывание массива времени
               read( unit = unit, fmt = *, iostat = stat ) input%t
               if ( stat .ne. 0_SP ) call scats_log_input_error('WR_t', file)

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          if ( allocated(input%x) ) then

               if ( size(input%x, kind=IP) .eq. N ) then

                    ! Считывание массива значений
                    read( unit = unit, fmt = *, iostat = stat ) input%x
                    if ( stat .ne. 0_SP ) call scats_log_input_error('WR_x', file)

               else

                    ! Освобождение памяти из-под массива значений
                    deallocate( input%x, stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_input_error('WD_x')

                    ! Выделение памяти под массив значений
                    allocate( input%x(0:N_m1), stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_input_error('WA_x')

                    ! Считывание массива значений
                    read( unit = unit, fmt = *, iostat = stat ) input%x
                    if ( stat .ne. 0_SP ) call scats_log_input_error('WR_x', file)

               endif

          else

               ! Выделение памяти под массив значений
               allocate( input%x(0:N_m1), stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_input_error('WA_x')

               ! Считывание массива значений
               read( unit = unit, fmt = *, iostat = stat ) input%x
               if ( stat .ne. 0_SP ) call scats_log_input_error('WR_x', file)

          endif

          ! Закрытие файла
          close( unit = unit, iostat = stat )
          if ( stat .ne. 0_SP ) call scats_log_input_error('WC', file) ! Проверка на ошибку закрытия файла

     end procedure scats_input_read
     
end submodule scats_input_read_s