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

          complex(RP), dimension(:), allocatable :: X ! Комплексные значения преобразования Фурье
          real(RP) :: delta_v ! Шаг по частотам

          integer(JP) :: i ! Счетчик
          real(RP) :: i_RP ! Овеществление счетчика
          integer(SP) :: stat ! Статусная переменная
 
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

               if ( .not. size(result%v, kind=JP) .eq. N_1_JP ) then

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

          if ( allocated(result%D) ) then

               if ( .not. size(result%D, kind=JP) .eq. N_1_JP ) then

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

          associate( delta_t => result%delta_t, &
                   & rx => result%x, &
                   & v => result%v, &
                   & D => result%D )

          ! Выделение памяти под массив комплексных значений преобразования Фурье
          allocate( X(0_JP:N_2_m1_JP), stat = stat )
          if ( stat .ne. 0_SP ) call scats_log_do_error('WA_X')

          ! Копирование вещественного массива значений
          X(0_JP:N_JP-1_JP)%re = rx(0:)
          X(N_JP:)%re = 0._RP
          X%im = 0._RP

          ! Выполнение быстрого преобразования Фурье
          call scats_do_periodogram_fft(X, N_2_JP, N_2_RP, N_2_log_JP)

          ! Вычисление периодограммы
          D(0:) = 1._RP / (N_RP * N_RP) * (X(0:N_1_JP)%re * X(0:N_1_JP)%re + X(0:N_1_JP)%im + X(0:N_1_JP)%im)

          ! Освобождение памяти из-под массива комплексных значений преобразования Фурье
          deallocate( X, stat = stat )
          if ( stat .ne. 0_SP ) call scats_log_do_error('WD_X')

          ! Вычисление шага по частотам
          delta_v = 1._RP / (N_2_RP * delta_t)

          ! Заполнение массива частот периодограммы

          do i = 0_JP, N_1_JP

               i_RP = real(i, kind=RP)
               v(i) = i_RP * delta_v

          enddo

          end associate

     end procedure scats_do_periodogram_calculate
     
end submodule scats_do_periodogram_calculate_s