submodule ( gen_settings_m ) read_gen_settings_s
implicit none
     
     contains
     
     ! Процедура для считывания настроек считывания параметров
     module procedure read_gen_settings
          
          integer(SP) :: stat ! Статусная переменная
          integer(UP) :: unit ! Номер дескриптора файла

          ! Открытие файла
          open( newunit = unit, file = file, action = 'read', status = 'old', iostat = stat)
          if ( stat .ne. 0_SP ) call log_gen_settings_error('WO', file) ! Проверка на ошибку открытия файла

          ! Пропуск строки
          read( unit = unit, fmt = '()' )

          ! Считывание ответа на вопрос о считывании шага выборки

          read( unit = unit, fmt = * , iostat = stat ) gen_settings%read_delta_t
          if ( stat .ne. 0_SP ) call log_gen_settings_error('WR_read_delta_t', file) ! Проверка на ошибку считывания

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание ответа на вопрос о считывании уровня значимости

          read( unit = unit, fmt = * , iostat = stat ) gen_settings%read_q
          if ( stat .ne. 0_SP ) call log_gen_settings_error('WR_read_q', file) ! Проверка на ошибку считывания

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание ответа на вопрос о считывании параметра \alpha линейного тренда

          read( unit = unit, fmt = * , iostat = stat ) gen_settings%read_alpha
          if ( stat .ne. 0_SP ) call log_gen_settings_error('WR_read_alpha', file) ! Проверка на ошибку считывания

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание ответа на вопрос о считывании параметра \beta линейного тренда

          read( unit = unit, fmt = * , iostat = stat ) gen_settings%read_beta
          if ( stat .ne. 0_SP ) call log_gen_settings_error('WR_read_beta', file) ! Проверка на ошибку считывания

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание ответа на вопрос о считывании массива амплитуд

          read( unit = unit, fmt = * , iostat = stat ) gen_settings%read_A
          if ( stat .ne. 0_SP ) call log_gen_settings_error('WR_read_A', file) ! Проверка на ошибку считывания

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание ответа на вопрос о считывании массива частот

          read( unit = unit, fmt = * , iostat = stat ) gen_settings%read_v
          if ( stat .ne. 0_SP ) call log_gen_settings_error('WR_read_v', file) ! Проверка на ошибку считывания

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )
          
          ! Считывание ответа на вопрос о считывании массива фазовых сдвигов

          read( unit = unit, fmt = * , iostat = stat ) gen_settings%read_phi
          if ( stat .ne. 0_SP ) call log_gen_settings_error('WR_read_phi', file) ! Проверка на ошибку считывания

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание ответа на вопрос о считывании отношения «сигнал к шуму»

          read( unit = unit, fmt = * , iostat = stat ) gen_settings%read_gamma
          if ( stat .ne. 0_SP ) call log_gen_settings_error('WR_read_gamma', file) ! Проверка на ошибку считывания

          ! Закрытие файла
          close( unit = unit, iostat = stat )
          if ( stat .ne. 0_SP ) call log_gen_settings_error('WC', file) ! Проверка на ошибку закрытия файла

     end procedure read_gen_settings
     
end submodule read_gen_settings_s