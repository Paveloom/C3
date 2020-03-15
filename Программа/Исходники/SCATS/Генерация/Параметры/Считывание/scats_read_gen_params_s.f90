submodule ( scats_gen_params_m ) scats_read_gen_params_s
implicit none
     
     contains
     
     ! Процедура для считывания параметров 
     ! для генерации временного ряда
     module procedure scats_read_gen_params
          
          integer(IP) :: pr ! Предыдущее значение r
          logical(LP) :: pr_eq_r ! Логическое значение pr .eq. gen_params%r  

          integer(SP) :: stat ! Статусная переменная
          integer(UP) :: unit ! Номер дескриптора файла

          ! Открытие файла
          open( newunit = unit, file = file, action = 'read', status = 'old', iostat = stat)
          if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WO', file) ! Проверка на ошибку открытия файла

          ! Пропуск строки
          read( unit = unit, fmt = '()' )

          ! Считывание значения размера выборки

          if (gen_params%settings%get_read_N_pt()) then

               read( unit = unit, fmt = * , iostat = stat ) gen_params%N
               if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WR_N', file) ! Проверка на ошибку считывания

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' ) 

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание значения шага выборки

          if (gen_params%settings%get_read_delta_t_pt()) then
               
               read( unit = unit, fmt = *, iostat = stat ) gen_params%delta_t
               if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WR_delta_t', file) ! Проверка на ошибку считывания

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' ) 

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание значения уровня значимости
          read( unit = unit, fmt = *, iostat = stat ) gen_params%q
          if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WR_q', file) ! Проверка на ошибку считывания

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание значения параметра \alpha

          if (gen_params%settings%get_read_alpha_pt()) then
               
               read( unit = unit, fmt = *, iostat = stat ) gen_params%alpha
               if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WR_alpha', file) ! Проверка на ошибку считывания

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' ) 

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание значения параметра \beta

          if (gen_params%settings%get_read_beta_pt()) then
               
               read( unit = unit, fmt = *, iostat = stat ) gen_params%beta
               if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WR_beta', file) ! Проверка на ошибку считывания

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' ) 

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Сохранение предыдущего значения r
          pr = gen_params%r

          ! Считывание значения числа гармонических компонент

          if (gen_params%settings%get_read_r_pt()) then

               read( unit = unit, fmt = *, iostat = stat ) gen_params%r
               if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WR_r', file) ! Проверка на ошибку считывания

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' ) 

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Сравнение предыдущего и текущего r

          pr_eq_r = pr .eq. gen_params%r

          ! [ Проверка, выделена ли память под массив амплитуд ]

          if ( allocated(gen_params%A) ) then

               ! Проверка, совпадает ли новое r с предыдущим

               if ( pr_eq_r ) then

                    ! Считывание значений массива амплитуд

                    if (gen_params%settings%get_read_A_pt()) then
                         
                         read( unit = unit, fmt = *, iostat = stat ) gen_params%A
                         if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WR_A', file) ! Проверка на ошибку считывания

                    else

                         ! Пропуск строки
                         read( unit = unit, fmt = '()' ) 

                    endif

               else

                    deallocate( gen_params%A, stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WD_A')

                    ! Выделение памяти под массив амплитуд

                    allocate( gen_params%A(gen_params%r), stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WA_A') ! Проверка на ошибку выделения памяти

                    ! Считывание значений массива амплитуд

                    if (gen_params%settings%get_read_A_pt()) then
                         
                         read( unit = unit, fmt = *, iostat = stat ) gen_params%A
                         if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WR_A', file) ! Проверка на ошибку считывания

                    else

                         ! Пропуск строки
                         read( unit = unit, fmt = '()' ) 

                    endif

               endif

          else

               allocate( gen_params%A(gen_params%r), stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WA_A') ! Проверка на ошибку выделения памяти

               ! Считывание значений массива амплитуд

               if (gen_params%settings%get_read_A_pt()) then
                    
                    read( unit = unit, fmt = *, iostat = stat ) gen_params%A
                    if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WR_A', file) ! Проверка на ошибку считывания

               else

                    ! Пропуск строки
                    read( unit = unit, fmt = '()' ) 

               endif

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! [ Проверка, выделена ли память под массив частот ]

          if ( allocated(gen_params%v) ) then

               ! Проверка, совпадает ли новое r с предыдущим

               if ( pr_eq_r ) then

                    ! Считывание значений массива частот

                    if (gen_params%settings%get_read_v_pt()) then
                         
                         read( unit = unit, fmt = *, iostat = stat ) gen_params%v
                         if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WR_v', file) ! Проверка на ошибку считывания

                    else

                         ! Пропуск строки
                         read( unit = unit, fmt = '()' ) 

                    endif

               else

                    deallocate( gen_params%v, stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WD_v')

                    ! Выделение памяти под массив частот

                    allocate( gen_params%v(gen_params%r), stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WA_v') ! Проверка на ошибку выделения памяти

                    ! Считывание значений массива частот

                    if (gen_params%settings%get_read_v_pt()) then
                         
                         read( unit = unit, fmt = *, iostat = stat ) gen_params%v
                         if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WR_v', file) ! Проверка на ошибку считывания

                    else

                         ! Пропуск строки
                         read( unit = unit, fmt = '()' ) 

                    endif

               endif

          else

               allocate( gen_params%v(gen_params%r), stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WA_v') ! Проверка на ошибку выделения памяти

               ! Считывание значений массива частот

               if (gen_params%settings%get_read_v_pt()) then
                    
                    read( unit = unit, fmt = *, iostat = stat ) gen_params%v
                    if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WR_v', file) ! Проверка на ошибку считывания

               else

                    ! Пропуск строки
                    read( unit = unit, fmt = '()' ) 

               endif

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! [ Проверка, выделена ли память под массив фазовых сдвигов ]

          if ( allocated(gen_params%phi) ) then

               ! Проверка, совпадает ли новое r с предыдущим

               if ( pr_eq_r ) then

                    ! Считывание значений массива фазовых сдвигов

                    if (gen_params%settings%get_read_phi_pt()) then
                         
                         read( unit = unit, fmt = *, iostat = stat ) gen_params%phi
                         if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WR_phi', file) ! Проверка на ошибку считывания

                    else

                         ! Пропуск строки
                         read( unit = unit, fmt = '()' ) 

                    endif

               else

                    deallocate( gen_params%phi, stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WD_phi')

                    ! Выделение памяти под массив фазовых сдвигов

                    allocate( gen_params%phi(gen_params%r), stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WA_phi') ! Проверка на ошибку выделения памяти

                    ! Считывание значений массива фазовых сдвигов

                    if (gen_params%settings%get_read_phi_pt()) then
                         
                         read( unit = unit, fmt = *, iostat = stat ) gen_params%phi
                         if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WR_phi', file) ! Проверка на ошибку считывания

                    else

                         ! Пропуск строки
                         read( unit = unit, fmt = '()' ) 

                    endif

               endif

          else

               allocate( gen_params%phi(gen_params%r), stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WA_phi') ! Проверка на ошибку выделения памяти

               ! Считывание значений массива фазовых сдвигов

               if (gen_params%settings%get_read_phi_pt()) then
                    
                    read( unit = unit, fmt = *, iostat = stat ) gen_params%phi
                    if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WR_phi', file) ! Проверка на ошибку считывания

               else

                    ! Пропуск строки
                    read( unit = unit, fmt = '()' ) 

               endif

          endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание значения отношения «сигнал к шуму»

          if (gen_params%settings%get_read_gamma_pt()) then
               
               read( unit = unit, fmt = *, iostat = stat ) gen_params%gamma
               if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WR_gamma', file) ! Проверка на ошибку считывания

          else

               ! Пропуск строки
               read( unit = unit, fmt = '()' ) 

          endif

          ! Закрытие файла
          close( unit = unit, iostat = stat )
          if ( stat .ne. 0_SP ) call scats_log_gen_params_error('WC', file) ! Проверка на ошибку закрытия файла

          ! Активация генератора
          call gen_params%turn_ready()

     end procedure scats_read_gen_params
     
end submodule scats_read_gen_params_s