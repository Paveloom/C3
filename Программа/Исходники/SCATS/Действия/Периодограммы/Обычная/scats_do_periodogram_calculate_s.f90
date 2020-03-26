submodule ( scats_do_periodogram_m ) scats_do_periodogram_calculate_s
implicit none

     contains

     ! Процедура для вычисления периодограммы
     module procedure scats_do_periodogram_calculate

          integer(JP) :: N_JP ! Размер выборки
          real(RP) :: N_RP ! Размер выборки (вещественное)
          integer(JP) :: N_2_log_JP ! Логарифм по степени 2 от числа N_2 (целое)
          integer(JP) :: N_1_JP ! Число N_1 (индекс)
          integer(JP) :: N_2_JP ! Число N_2 (индекс)
          integer(JP) :: N_2_m1_JP ! Число N_2 - 1 (индекс)
          real(RP) :: N_2_RP ! Число N_2 (вещественное)

          complex(RP), dimension(:), allocatable :: X_FFT ! Массив комплексных значений преобразования Фурье
          real(RP) :: delta_v ! Шаг по частотам

          real(RP) :: var ! Оценка дисперсии ряда
          real(RP) :: X_1 ! Критическое значение для разделения шум / сигнал

          integer(JP) :: i ! Счетчик
          real(RP) :: i_RP ! Овеществление счетчика
          integer(SP) :: stat ! Статусная переменная

          ! Проверка, выделена ли память под массивы
          if ( .not. allocated(result%t) ) call scats_log_do_error('NA_t')
          if ( .not. allocated(result%x) ) call scats_log_do_error('NA_x')

          ! Определение размера выборки
          N_JP = size(result%x, kind=JP)
          N_RP = real(N_JP, kind=RP)

          ! Определение степени логарифма по степени 2 от числа 2 * N_1, где N_1 > N и N_1 кратно двум
          N_2_log_JP = ceiling(log(N_RP) / log(2._RP), kind=JP) + 1_JP

          ! Определение числа N_2 и его конвертация
          N_2_JP = 2_JP ** N_2_log_JP
          N_2_m1_JP = N_2_JP - 1_JP
          N_2_RP = real(N_2_JP, kind=RP)

          ! Вычисление числа N_1 - 1
          N_1_JP = N_2_JP / 2_JP

          ! Проверка, выделена ли память под массив частот периодограммы
          if ( allocated(result%v) ) then

               if ( .not. size(result%v, kind=JP) .eq. N_1_JP + 1_JP ) then

                    ! Освобождение памяти из-под массива частот периодограммы
                    deallocate( result%v, stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_do_error('WD_v')

                    ! Выделение памяти под массив частот периодограммы
                    allocate( result%v(0_JP:N_1_JP), stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_do_error('WA_v')

               endif

          else

               ! Выделение памяти под массив частот периодограммы
               allocate( result%v(0_JP:N_1_JP), stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_do_error('WA_v')

          endif

          ! Проверка, выделена ли память под массив значений периодограммы
          if ( allocated(result%D) ) then

               if ( .not. size(result%D, kind=JP) .eq. N_1_JP + 1_JP ) then

                    ! Освобождение памяти из-под массива значений периодограммы
                    deallocate( result%D, stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_do_error('WD_D')

                    ! Выделение памяти под массив значений периодограммы
                    allocate( result%D(0_JP:N_1_JP), stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_do_error('WA_D')

               endif

          else

               ! Выделение памяти под массив значений периодограммы
               allocate( result%D(0_JP:N_1_JP), stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_do_error('WA_D')

          endif

          ! Проверка, выделена ли память под модуль преобразованных значений
          if ( allocated(result%X_FFT_ABS) ) then

               if ( .not. size(result%X_FFT_ABS, kind=JP) .eq. N_2_JP ) then

                    ! Освобождение памяти из-под модуля преобразованных значений
                    deallocate( result%X_FFT_ABS, stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_do_error('WD_X_FFT_ABS')

                    ! Выделение памяти под модуль преобразованных значений
                    allocate( result%X_FFT_ABS(0_JP:N_2_m1_JP), stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_do_error('WA_X_FFT_ABS')

               endif

          else

               ! Выделение памяти под модуль преобразованных значений
               allocate( result%X_FFT_ABS(0_JP:N_2_m1_JP), stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_do_error('WA_X_FFT_ABS')

          endif

          ! Распаковка результата
          associate( delta_t => result%delta_t, &
                   & rx => result%x, &
                   & q => result%q, &
                   & threshold => result%threshold, &
                   & v => result%v, &
                   & D => result%D )

          ! Выделение памяти под массив комплексных значений преобразования Фурье
          allocate( X_FFT(0_JP:N_2_m1_JP), stat = stat )
          if ( stat .ne. 0_SP ) call scats_log_do_error('WA_X_FFT')

          ! Копирование вещественного массива значений
          X_FFT(0_JP:N_JP-1_JP)%re = rx(0:)
          X_FFT(N_JP:)%re = 0._RP
          X_FFT%im = 0._RP

          ! Выполнение быстрого преобразования Фурье
          call scats_do_fft_calculate(X_FFT, N_2_JP, N_2_RP, N_2_log_JP, .false._LP)

          ! Вычисление модуля преобразованных значений
          result%X_FFT_ABS(0:) = X_FFT(0:)%re * X_FFT(0:)%re + X_FFT(0:)%im + X_FFT(0:)%im

          ! Освобождение памяти из-под массива комплексных значений преобразования Фурье
          deallocate( X_FFT, stat = stat )
          if ( stat .ne. 0_SP ) call scats_log_do_error('WD_X_FFT')

          ! Вычисление периодограммы
          D(0:) = 1._RP / (N_RP * N_RP) * result%X_FFT_ABS(0:N_1_JP)

          ! Вычисление шага по частотам
          delta_v = 1._RP / (N_2_RP * delta_t)

          ! Заполнение массива частот периодограммы

          do i = 0_JP, N_1_JP

               i_RP = real(i, kind=RP)
               v(i) = i_RP * delta_v

          enddo

          ! Оценивание дисперсии ряда
          var = 1._RP / ( N_RP - 1._RP) * sum(rx * rx)

          ! Вычисление критического значения для разделения шум / сигнал
          X_1 = - log(1._RP - (1._RP - q) ** ( 2._RP / (N_RP - 2._RP) ))

          ! Вычисление порога обнаружения сигнала
          threshold = var * X_1 / N_RP

          end associate

     end procedure scats_do_periodogram_calculate

end submodule scats_do_periodogram_calculate_s