submodule ( scats_gen_params_m ) scats_gen_params_read_s
implicit none

     contains

     ! Процедура для считывания параметров
     ! для генерации временного ряда
     module procedure scats_gen_params_read

          integer(IP) :: pr ! Предыдущее значение r
          logical(LP) :: pr_ne_r ! Логическое значение pr .ne. gen_params%r

          integer(SP) :: stat ! Статусная переменная
          integer(UP) :: unit ! Номер дескриптора файла

          ! Открытие файла
          open( newunit = unit, file = file, action = 'read', status = 'old', iostat = stat)
          if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WO', call_stat, file); return; endif

          ! Пропуск строки
          read( unit = unit, fmt = '()' )

          ! Проверка, требуется ли считывание значения размера выборки
          if (gen_params%settings%read_N) then

               ! Считывание значения размера выборки
               read( unit = unit, fmt = * , iostat = stat ) gen_params%N
               if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WR_N', call_stat, file); return; endif

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' )

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Проверка, требуется ли считывание значения шага выборки
          if (gen_params%settings%read_delta_t) then

               ! Считывание значения шага выборки
               read( unit = unit, fmt = *, iostat = stat ) gen_params%delta_t
               if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WR_delta_t', call_stat, file); return; endif

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' )

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Проверка, требуется ли считывание значения уровня значимости
          if (gen_params%settings%read_q) then

               ! Считывание значения уровня значимости
               read( unit = unit, fmt = *, iostat = stat ) gen_params%q
               if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WR_q', call_stat, file); return; endif

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' )

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Проверка, требуется ли считывание значения параметра \alpha
          if (gen_params%settings%read_alpha) then

               ! Считывание значения параметра \alpha
               read( unit = unit, fmt = *, iostat = stat ) gen_params%alpha
               if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WR_alpha', call_stat, file); return; endif

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' )

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Проверка, требуется ли считывание значения параметра \beta
          if (gen_params%settings%read_beta) then

               ! Считывание значения параметра \beta
               read( unit = unit, fmt = *, iostat = stat ) gen_params%beta
               if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WR_beta', call_stat, file); return; endif

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' )

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Сохранение предыдущего значения r
          pr = gen_params%r

          ! Проверка, требуется ли считывание значения числа гармонических компонент
          if (gen_params%settings%read_r) then

               ! Считывание значения числа гармонических компонент
               read( unit = unit, fmt = *, iostat = stat ) gen_params%r
               if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WR_r', call_stat, file); return; endif

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' )

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Сравнение предыдущего и текущего r
          pr_ne_r = pr .ne. gen_params%r

          ! Проверка, требуется ли считывание значений массива амплитуд
          if (gen_params%settings%read_A) then

               ! Проверка, выделена ли память под массив амплитуд
               if ( allocated(gen_params%A) ) then

                    ! Проверка, совпадает ли новое r с предыдущим
                    if ( pr_ne_r ) then

                         ! Освобождение памяти из-под массива амплитуд
                         deallocate( gen_params%A, stat = stat )
                         if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WD_A', call_stat); return; endif

                         ! Выделение памяти под массив амплитуд
                         allocate( gen_params%A(gen_params%r), stat = stat )
                         if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WA_A', call_stat); return; endif

                    endif

               else

                    ! Выделение памяти под массив амплитуд
                    allocate( gen_params%A(gen_params%r), stat = stat )
                    if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WA_A', call_stat); return; endif

               endif

               ! Считывание значений массива амплитуд
               read( unit = unit, fmt = *, iostat = stat ) gen_params%A
               if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WR_A', call_stat, file); return; endif

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' )

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Проверка, требуется ли считывание значений массива частот
          if (gen_params%settings%read_v) then

               ! Проверка, выделена ли память под массив частот
               if ( allocated(gen_params%v) ) then

                    ! Проверка, совпадает ли новое r с предыдущим
                    if ( pr_ne_r ) then

                         ! Освобождение памяти из-под массива частот
                         deallocate( gen_params%v, stat = stat )
                         if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WD_v', call_stat); return; endif

                         ! Выделение памяти под массив частот
                         allocate( gen_params%v(gen_params%r), stat = stat )
                         if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WA_v', call_stat); return; endif

                    endif

               else

                    ! Выделение памяти под массив частот
                    allocate( gen_params%v(gen_params%r), stat = stat )
                    if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WA_v', call_stat); return; endif

               endif

               ! Считывание значений массива частот
               read( unit = unit, fmt = *, iostat = stat ) gen_params%v
               if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WR_v', call_stat, file); return; endif

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' )

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Проверка, требуется ли считывание значений массива фазовых сдвигов
          if (gen_params%settings%read_phi) then

               ! Проверка, выделена ли память под массив фазовых сдвигов
               if ( allocated(gen_params%phi) ) then

                    ! Проверка, совпадает ли новое r с предыдущим
                    if ( pr_ne_r ) then

                         ! Освобождение памяти из-под массива фазовых сдвигов
                         deallocate( gen_params%phi, stat = stat )
                         if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WD_phi', call_stat); return; endif

                         ! Выделение памяти под массив фазовых сдвигов
                         allocate( gen_params%phi(gen_params%r), stat = stat )
                         if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WA_phi', call_stat); return; endif

                    endif

               else

                    ! Выделение памяти под массив фазовых сдвигов
                    allocate( gen_params%phi(gen_params%r), stat = stat )
                    if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WA_phi', call_stat); return; endif

               endif

               ! Считывание значений массива фазовых сдвигов
               read( unit = unit, fmt = *, iostat = stat ) gen_params%phi
               if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WR_phi', call_stat, file); return; endif

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' )

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Проверка, требуется ли считывание значения отношения «сигнал к шуму»
          if (gen_params%settings%read_gamma) then

               ! Считывание значения отношения «сигнал к шуму»
               read( unit = unit, fmt = *, iostat = stat ) gen_params%gamma
               if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WR_gamma', call_stat, file); return; endif

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' )

          endif

          ! Закрытие файла
          close( unit = unit, iostat = stat )
          if ( stat .ne. 0_SP ) then; call scats_gen_params_log_error('WC', call_stat, file); return; endif

          ! Активация генератора
          gen_params%ready = .true.

     end procedure scats_gen_params_read

end submodule scats_gen_params_read_s