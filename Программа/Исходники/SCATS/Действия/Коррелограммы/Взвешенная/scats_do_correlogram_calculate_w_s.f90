submodule ( scats_do_correlogram_m ) scats_do_correlogram_calculate_w_s
implicit none

     contains

     ! Процедура для вычисления взвешенной коррелограммы
     module procedure scats_do_correlogram_calculate_w

          integer(JP) :: N_s_JP ! Значение N* (индекс)
          integer(JP) :: N_m1_s_JP ! Значение N*-1 (индекс)
          real(RP) :: N_s_RP ! Значение N* (вещественное)

          real(RP) :: a2 ! Значение 2*a
          real(RP) :: a2d ! Значение 1 - 2*a
          real(RP) :: piN_s ! Значение pi / N*

          integer(JP) :: m ! Счетчик
          real(RP) :: m_RP ! Овеществление m

          integer(SP) :: stat ! Статусная переменная

          ! Проверка, выделена ли память под массив времени
          if ( .not. allocated(result%t) ) then; call scats_do_errors_log_error('NA_t', call_stat); return; endif

          ! Проверка, выделена ли память под массив значений коррелограммы
          if ( .not. allocated(result%c) ) then; call scats_do_errors_log_error('NA_c', call_stat); return; endif

          ! Проверка, допустимо ли значение фактора перед N
          if ( nfactor .lt. 0.1_RP .or. nfactor .gt. 1.0_RP ) then; call scats_do_errors_log_error('W_nfactor', call_stat); return; endif

          ! Проверка, допустимо ли значение множителя a
          if ( a .lt. 0._RP .or. a .gt. 0.25_RP ) then; call scats_do_errors_log_error('W_a', call_stat); return; endif

          ! Вычисление числа N* и его конвертация
          N_s_JP = nint(real(size(result%t, kind=JP), kind=RP) * nfactor)
          N_s_RP = real(N_s_JP, kind=RP)

          ! Вычисление числа N*-1
          N_m1_s_JP = N_s_JP - 1_JP

          ! Проверка, выделена ли память под массив значений взвешенной коррелограммы
          if ( allocated(result%cw) ) then

               if ( .not. size(result%cw, kind=JP) .eq. N_s_JP ) then

                    ! Освобождение памяти из-под массива значений взвешенной коррелограммы
                    deallocate( result%cw, stat = stat )
                    if ( stat .ne. 0_SP ) then; call scats_do_errors_log_error('WD_cw', call_stat); return; endif

                    ! Выделение памяти под массив значений взвешенной коррелограммы
                    allocate( result%cw(0_JP:N_m1_s_JP), stat = stat )
                    if ( stat .ne. 0_SP ) then; call scats_do_errors_log_error('WA_cw', call_stat); return; endif

               endif

          else

               ! Выделение памяти под массив значений взвешенной коррелограммы
               allocate( result%cw(0_JP:N_m1_s_JP), stat = stat )
               if ( stat .ne. 0_SP ) then; call scats_do_errors_log_error('WA_cw', call_stat); return; endif

          endif

          ! Вычисление вспомогательных значений
          a2 = a * 2._RP
          a2d = 1._RP - a2
          piN_s = 4._RP * atan(1._RP) / N_s_RP

          ! Вычисление значений взвешенной коррелограммы
          do m = 0_JP, N_m1_s_JP

               m_RP = real(m, kind=RP)
               result%cw(m) = result%c(m) * (a2d + a2 * cos(piN_s * m_RP))

          enddo

     end procedure scats_do_correlogram_calculate_w

end submodule scats_do_correlogram_calculate_w_s