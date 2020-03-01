submodule ( gen_params_m ) read_gen_params_s ! Процедура для считывания параметров 
                                             ! для генерации временного ряда
implicit none
     
     contains
     
     ! Процедура для считывания параметров
     module procedure read_gen_params
          
          integer(SP) :: stat ! Статусная переменная
          integer(UP) :: unit ! Номер дескриптора файла

          ! Открытие файла
          open( newunit = unit, file = file, action = 'read', status = 'old', iostat = stat)
          if ( stat .ne. 0_SP ) call log_gen_params_error('WO', file) ! Проверка на ошибку открытия файла

          ! Считывание значения размера выборки

          ! Пропуск строки
          read( unit = unit, fmt = '()' )

          read( unit = unit, fmt = * , iostat = stat ) gen_params%N
          if ( stat .ne. 0_SP ) call log_gen_params_error('WR_N', file) ! Проверка на ошибку считывания

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание значения шага выборки

          ! if (settings%get_do_read_r()) then
               
               read( unit = unit, fmt = *, iostat = stat ) gen_params%delta_t
               if ( stat .ne. 0_SP ) call log_gen_params_error('WR_delta_t', file) ! Проверка на ошибку считывания

          ! else

          !      ! Пропуск строки
          !      read( unit = unit, fmt = '()' ) 

          ! endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание значения уровня значимости
          read( unit = unit, fmt = *, iostat = stat ) gen_params%q
          if ( stat .ne. 0_SP ) call log_gen_params_error('WR_q', file) ! Проверка на ошибку считывания

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание значения параметра \alpha

          ! if (settings%get_do_read_alpha_1()) then
               
               read( unit = unit, fmt = *, iostat = stat ) gen_params%alpha
               if ( stat .ne. 0_SP ) call log_gen_params_error('WR_alpha', file) ! Проверка на ошибку считывания

          ! else

          !      ! Пропуск строки
          !      read( unit = unit, fmt = '()' ) 

          ! endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание значения параметра \beta

          ! if (settings%get_do_read_beta_1()) then
               
               read( unit = unit, fmt = *, iostat = stat ) gen_params%beta
               if ( stat .ne. 0_SP ) call log_gen_params_error('WR_beta', file) ! Проверка на ошибку считывания

          ! else

          !      ! Пропуск строки
          !      read( unit = unit, fmt = '()' ) 

          ! endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание значения числа гармонических компонент

          read( unit = unit, fmt = *, iostat = stat ) gen_params%r
          if ( stat .ne. 0_SP ) call log_gen_params_error('WR_r', file) ! Проверка на ошибку считывания

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Выделение памяти под массив амплитуд

          allocate( gen_params%A(gen_params%r), stat = stat )
          if ( stat .ne. 0_SP ) call log_gen_params_error('WA_A') ! Проверка на ошибку выделения памяти

          ! Считывание значений массива амплитуд

          ! if (settings%get_do_read_alpha_2()) then
               
               read( unit = unit, fmt = *, iostat = stat ) gen_params%A
               if ( stat .ne. 0_SP ) call log_gen_params_error('WR_A', file) ! Проверка на ошибку считывания

          ! else

          !      ! Пропуск строки
          !      read( unit = unit, fmt = '()' ) 

          ! endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Выделение памяти под массив частот

          allocate( gen_params%v(gen_params%r), stat = stat )
          if ( stat .ne. 0_SP ) call log_gen_params_error('WA_v') ! Проверка на ошибку выделения памяти

          ! Считывание значений массива частот

          ! if (settings%get_do_read_alpha_2()) then
               
               read( unit = unit, fmt = *, iostat = stat ) gen_params%v
               if ( stat .ne. 0_SP ) call log_gen_params_error('WR_v', file) ! Проверка на ошибку считывания

          ! else

          !      ! Пропуск строки
          !      read( unit = unit, fmt = '()' ) 

          ! endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Выделение памяти под массив фазовых сдвигов

          allocate( gen_params%phi(gen_params%r), stat = stat )
          if ( stat .ne. 0_SP ) call log_gen_params_error('WA_phi') ! Проверка на ошибку выделения памяти

          ! Считывание значений массива фазовых сдвигов

          ! if (settings%get_do_read_alpha_2()) then
               
               read( unit = unit, fmt = *, iostat = stat ) gen_params%phi
               if ( stat .ne. 0_SP ) call log_gen_params_error('WR_phi', file) ! Проверка на ошибку считывания

          ! else

          !      ! Пропуск строки
          !      read( unit = unit, fmt = '()' ) 

          ! endif

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание значения отношения «сигнал к шуму»

          ! if (settings%get_do_read_beta_2()) then
               
               read( unit = unit, fmt = *, iostat = stat ) gen_params%gamma
               if ( stat .ne. 0_SP ) call log_gen_params_error('WR_gamma', file) ! Проверка на ошибку считывания

          ! else

          !      ! Пропуск строки
          !      read( unit = unit, fmt = '()' ) 

          ! endif

          ! Закрытие файла
          close( unit = unit, iostat = stat )
          if ( stat .ne. 0_SP ) call log_gen_params_error('WC', file) ! Проверка на ошибку закрытия файла

     end procedure read_gen_params
     
end submodule read_gen_params_s