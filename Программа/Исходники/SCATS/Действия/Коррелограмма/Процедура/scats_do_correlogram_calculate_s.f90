submodule ( scats_do_correlogram_m ) scats_do_correlogram_calculate_s
implicit none
     
     contains
     
     ! Процедура для вычисления коррелограммы
     module procedure scats_do_correlogram_calculate
          
          integer(JP) :: N_JP ! Размер выборки
          integer(JP) :: N_m1_JP ! Размер выборки - 1
          real(RP) :: N_RP ! Размер выборки (вещественное)
          integer(JP) :: N_2_log_JP ! Логарифм по степени 2 от числа N_2 (целое)
          integer(JP) :: N_2_JP ! Число N_2 (индекс)
          real(RP) :: N_2_RP ! Число N_2 (вещественное)
          integer(JP) :: N_2_m1_JP ! Число N_2 - 1 (индекс)

          complex(RP), dimension(:), allocatable :: X_FFT ! Массив комплексных значений преобразования Фурье

          integer(SP) :: stat ! Статусная переменная

          ! Проверка, выделена ли память под массив времени
          if ( .not. allocated(result%t) ) call scats_log_do_error('NA_t')

          ! Определение размера выборки
          N_JP = size(result%t, kind=JP)
          N_RP = real(N_JP, kind=RP)

          ! Вычисление числа N - 1
          N_m1_JP = N_JP - 1_JP

          ! Определение степени логарифма по степени 2 от числа 2 * N_1, где N_1 > N и N_1 кратно двум
          N_2_log_JP = ceiling(log(N_RP) / log(2._RP), kind=JP) + 1_JP

          ! Определение числа N_2 и его конвертация
          N_2_JP = 2_JP ** N_2_log_JP
          N_2_RP = real(N_2_JP, kind=RP)

          ! Вычисление числа N_2 - 1
          N_2_m1_JP = N_2_JP - 1_JP

          ! Выделение памяти под массив комплексных значений преобразования Фурье
          allocate( X_FFT(0_JP:N_2_m1_JP), stat = stat )
          if ( stat .ne. 0_SP ) call scats_log_do_error('WA_X_FFT')

          ! Проверка, выделена ли память под модуль преобразованных значений
          if ( allocated(result%X_FFT_ABS) ) then

               if ( .not. size(result%X_FFT_ABS, kind=JP) .eq. N_2_JP ) then

                    ! Проверка, выделена ли память под массив значений
                    if ( .not. allocated(result%x) ) call scats_log_do_error('NA_x')

                    ! Освобождение памяти из-под модуля преобразованных значений
                    deallocate( result%X_FFT_ABS, stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_do_error('WD_X_FFT_ABS')

                    ! Выделение памяти под модуль преобразованных значений
                    allocate( result%X_FFT_ABS(0_JP:N_2_m1_JP), stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_do_error('WA_X_FFT_ABS')

                    ! Копирование вещественного массива значений
                    X_FFT(0_JP:N_m1_JP)%re = result%x(0:)
                    X_FFT(N_JP:)%re = 0._RP
                    X_FFT%im = 0._RP

                    ! Выполнение быстрого преобразования Фурье
                    call scats_do_fft_calculate(X_FFT, N_2_JP, N_2_RP, N_2_log_JP, .false._LP)

                    ! Вычисление модуля преобразованных значений
                    result%X_FFT_ABS(0:) = X_FFT(0:)%re * X_FFT(0:)%re + X_FFT(0:)%im + X_FFT(0:)%im

               endif

          else

               ! Проверка, выделена ли память под массив значений
               if ( .not. allocated(result%x) ) call scats_log_do_error('NA_x')

               ! Выделение памяти под модуль преобразованных значений
               allocate( result%X_FFT_ABS(0_JP:N_2_m1_JP), stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_do_error('WA_X_FFT_ABS')

               ! Копирование вещественного массива значений
               X_FFT(0_JP:N_m1_JP)%re = result%x(0:)
               X_FFT(N_JP:)%re = 0._RP
               X_FFT%im = 0._RP

               ! Выполнение быстрого преобразования Фурье
               call scats_do_fft_calculate(X_FFT, N_2_JP, N_2_RP, N_2_log_JP, .false._LP)

               ! Вычисление модуля преобразованных значений
               result%X_FFT_ABS(0:) = X_FFT(0:)%re * X_FFT(0:)%re + X_FFT(0:)%im + X_FFT(0:)%im

          endif

          ! Вычисление квадрата модуля комплексных значений преобразования Фурье
          X_FFT(0:)%re = result%X_FFT_ABS(0:) ** 2
          X_FFT(0:)%im = 0._RP

          ! Выполнение обратного преобразования Фурье
          call scats_do_fft_calculate(X_FFT, N_2_JP, N_2_RP, N_2_log_JP, .true._LP)

          ! Проверка, выделена ли память под массив значений коррелограммы
          if ( allocated(result%c) ) then

               if ( .not. size(result%c, kind=JP) .eq. N_JP ) then

                    ! Освобождение памяти из-под массива значений коррелограммы
                    deallocate( result%c, stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_do_error('WD_c')

                    ! Выделение памяти под массив значений коррелограммы
                    allocate( result%c(0_JP:N_m1_JP), stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_do_error('WA_c')

               endif

          else

               ! Выделение памяти под массив значений коррелограммы
               allocate( result%c(0_JP:N_m1_JP), stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_do_error('WA_c')

          endif

          ! Вычисление коррелограммы
          result%c(0:) = 1._RP / N_RP * X_FFT(0_JP:N_m1_JP)%re

          ! Освобождение памяти из-под массива комплексных значений преобразования Фурье
          deallocate( X_FFT, stat = stat )
          if ( stat .ne. 0_SP ) call scats_log_do_error('WD_X_FFT')

     end procedure scats_do_correlogram_calculate
     
end submodule scats_do_correlogram_calculate_s