submodule ( scats_do_periodogram_m ) scats_do_periodogram_calculate_w_s
implicit none

     contains

     ! Процедура для вычисления сглаженной периодограммы
     module procedure scats_do_periodogram_calculate_w

          integer(JP) :: N_JP ! Размер выборки
          real(RP) :: N_RP ! Размер выборки (вещественное)
          integer(JP) :: N_2_log_JP ! Логарифм по степени 2 от числа N_2 (целое)
          integer(JP) :: N_1_JP ! Число N_1 (индекс)
          integer(JP) :: N_2_JP ! Число N_2 (индекс)
          real(RP) :: N_2_RP ! Число N_2 (вещественное)
          integer(JP) :: N_2_m1_JP ! Число N_2 - 1 (индекс)
          integer(JP) :: N_s_JP ! Число N* (индекс)
          real(RP) :: N_s_RP ! Число N* (вещественное)

          complex(RP), dimension(:), allocatable :: X_FFT ! Массив комплексных значений преобразования Фурье

          real(RP) :: delta_v ! Шаг по частоте

          integer(JP) :: i ! Счетчик
          real(RP) :: i_RP ! Овеществление счетчика

          integer(SP) :: stat ! Статусная переменная

          ! Проверка, выделена ли память под массив времени
          if ( .not. allocated(result%t) ) then; call scats_do_errors_log_error('NA_t', call_stat); return; endif

          ! Проверка, выделена ли память под массив значений сглаженной коррелограммы
          if ( .not. allocated(result%cw) ) then; call scats_do_errors_log_error('NA_cw', call_stat); return; endif

          ! Определение размера выборки
          N_JP = size(result%t, kind=JP)
          N_RP = real(N_JP, kind=RP)

          ! Определение степени логарифма по степени 2 от числа 2 * N_1, где N_1 > N и N_1 кратно двум
          N_2_log_JP = ceiling(log(N_RP) / log(2._RP), kind=JP) + 1_JP

          ! Определение числа N_2 и его конвертация
          N_2_JP = 2_JP ** N_2_log_JP
          N_2_RP = real(N_2_JP, kind=RP)

          ! Вычисление числа N_2 - 1
          N_2_m1_JP = N_2_JP - 1_JP

          ! Вычисление числа N_1 - 1
          N_1_JP = N_2_JP / 2_JP

          ! Определение числа N* и его конвертация
          N_s_JP = size(result%cw, kind=JP)
          N_s_RP = real(N_s_JP, kind=RP)

          ! Проверка, выделена ли память под массив значений сглаженной периодограммы
          if ( allocated(result%Dw) ) then

               if ( .not. size(result%Dw, kind=JP) .eq. N_1_JP + 1_JP ) then

                    ! Освобождение памяти из-под массива значений сглаженной периодограммы
                    deallocate( result%Dw, stat = stat )
                    if ( stat .ne. 0_SP ) then; call scats_do_errors_log_error('WD_Dw', call_stat); return; endif

                    ! Выделение памяти под массив значений сглаженной периодограммы
                    allocate( result%Dw(0_JP:N_1_JP), stat = stat )
                    if ( stat .ne. 0_SP ) then; call scats_do_errors_log_error('WA_Dw', call_stat); return; endif

               endif

          else

               ! Выделение памяти под массив значений сглаженной периодограммы
               allocate( result%Dw(0_JP:N_1_JP), stat = stat )
               if ( stat .ne. 0_SP ) then; call scats_do_errors_log_error('WA_Dw', call_stat); return; endif

          endif

          ! Проверка, выделена ли память под массив частот периодограммы
          if ( allocated(result%v) ) then

               if ( size(result%v, kind=JP) .ne. N_1_JP + 1_JP ) then

                    ! Освобождение памяти из-под массива частот периодограммы
                    deallocate( result%v, stat = stat )
                    if ( stat .ne. 0_SP ) then; call scats_do_errors_log_error('WD_v', call_stat); return; endif

                    ! Выделение памяти под массив частот периодограммы
                    allocate( result%v(0_JP:N_1_JP), stat = stat )
                    if ( stat .ne. 0_SP ) then; call scats_do_errors_log_error('WA_v', call_stat); return; endif

                    ! Вычисление шага по частотам
                    delta_v = 1._RP / (N_2_RP * result%delta_t)

                    ! Заполнение массива частот периодограммы

                    do i = 0_JP, N_1_JP

                         i_RP = real(i, kind=RP)
                         result%v(i) = i_RP * delta_v

                    enddo

               endif

          else

               ! Выделение памяти под массив частот периодограммы
               allocate( result%v(0_JP:N_1_JP), stat = stat )
               if ( stat .ne. 0_SP ) then; call scats_do_errors_log_error('WA_v', call_stat); return; endif

               ! Вычисление шага по частотам
               delta_v = 1._RP / (N_2_RP * result%delta_t)

               ! Заполнение массива частот периодограммы

               do i = 0_JP, N_1_JP

                    i_RP = real(i, kind=RP)
                    result%v(i) = i_RP * delta_v

               enddo

          endif

          ! Выделение памяти под массив комплексных значений преобразования Фурье
          allocate( X_FFT(0_JP:N_2_m1_JP), stat = stat )
          if ( stat .ne. 0_SP ) then; call scats_do_errors_log_error('WA_X_FFT', call_stat); return; endif

          ! Копирование вещественного массива значений
          X_FFT(0_JP:N_s_JP-1_JP)%re = result%cw(0:)
          X_FFT(N_s_JP:)%re = 0._RP
          X_FFT%im = 0._RP

          ! Выполнение быстрого преобразования Фурье
          call scats_do_fft_calculate(X_FFT, N_2_JP, N_2_RP, N_2_log_JP, .false._LP)

          ! Вычисление сглаженной периодограммы
          result%Dw(0:) = 1._RP / N_s_RP * (2._RP * X_FFT(0_JP:N_1_JP)%re - result%cw(0))

          ! Освобождение памяти из-под массива комплексных значений преобразования Фурье
          deallocate( X_FFT, stat = stat )
          if ( stat .ne. 0_SP ) then; call scats_do_errors_log_error('WD_X_FFT', call_stat); return; endif

     end procedure scats_do_periodogram_calculate_w

end submodule scats_do_periodogram_calculate_w_s