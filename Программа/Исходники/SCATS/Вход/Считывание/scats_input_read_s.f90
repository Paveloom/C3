submodule ( scats_input_m ) scats_input_read_s
implicit none

     contains

     ! Процедура для считывания входных данных
     module procedure scats_input_read

          integer(SP) :: stat ! Статусная переменная
          integer(UP) :: unit ! Номер дескриптора файла

          integer(JP) :: N ! Размер выборки
          integer(JP) :: N_m1 ! Размер выборки - 1

          ! Открытие файла
          open( newunit = unit, file = file, action = 'read', status = 'old', iostat = stat)
          if ( stat .ne. 0_SP ) call scats_input_log_error('WO', file)

          ! Пропуск строки
          read( unit = unit, fmt = '()' )

          ! Считывание размера выборки
          read( unit = unit, fmt = *, iostat = stat ) N
          if ( stat .ne. 0_SP ) call scats_input_log_error('WR_N', file)

          ! Конвертация
          N_m1 = N - 1_JP

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание шага выборки
          read( unit = unit, fmt = *, iostat = stat ) input%delta_t
          if ( stat .ne. 0_SP ) call scats_input_log_error('WR_delta_t', file)

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Проверка, выделена ли память под массив времени
          if ( allocated(input%t) ) then

               if ( .not. (size(input%t, kind=JP) .eq. N) ) then

                    ! Освобождение памяти из-под массива времени
                    deallocate( input%t, stat = stat )
                    if ( stat .ne. 0_SP ) call scats_input_log_error('WD_t')

                    ! Выделение памяти под массив времени
                    allocate( input%t(0:N_m1), stat = stat )
                    if ( stat .ne. 0_SP ) call scats_input_log_error('WA_t')

               endif

          else

               ! Выделение памяти под массив времени
               allocate( input%t(0:N_m1), stat = stat )
               if ( stat .ne. 0_SP ) call scats_input_log_error('WA_t')

          endif

          ! Считывание массива времени
          read( unit = unit, fmt = *, iostat = stat ) input%t
          if ( stat .ne. 0_SP ) call scats_input_log_error('WR_t', file)

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Проверка, выделена ли память под массив значений
          if ( allocated(input%x) ) then

               if ( .not. (size(input%x, kind=JP) .eq. N) ) then

                    ! Освобождение памяти из-под массива значений
                    deallocate( input%x, stat = stat )
                    if ( stat .ne. 0_SP ) call scats_input_log_error('WD_x')

                    ! Выделение памяти под массив значений
                    allocate( input%x(0:N_m1), stat = stat )
                    if ( stat .ne. 0_SP ) call scats_input_log_error('WA_x')

               endif

          else

               ! Выделение памяти под массив значений
               allocate( input%x(0:N_m1), stat = stat )
               if ( stat .ne. 0_SP ) call scats_input_log_error('WA_x')

          endif

          ! Считывание массива значений
          read( unit = unit, fmt = *, iostat = stat ) input%x
          if ( stat .ne. 0_SP ) call scats_input_log_error('WR_x', file)

          ! Закрытие файла
          close( unit = unit, iostat = stat )
          if ( stat .ne. 0_SP ) call scats_input_log_error('WC', file)

     end procedure scats_input_read

end submodule scats_input_read_s