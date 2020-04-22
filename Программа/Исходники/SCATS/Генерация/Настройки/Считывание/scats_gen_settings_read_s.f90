submodule ( scats_gen_settings_m ) scats_gen_settings_read_s
implicit none

     contains

     ! Процедура для считывания настроек считывания параметров
     module procedure scats_gen_settings_read

          integer(SP) :: stat ! Статусная переменная
          integer(UP) :: unit ! Номер дескриптора файла

          ! Открытие файла
          open( newunit = unit, file = file, action = 'read', status = 'old', iostat = stat)
          if ( stat .ne. 0_SP ) call gen_settings%log('WO', file)

          ! Пропуск строки
          read( unit = unit, fmt = '()' )

          ! Считывание ответа на вопрос о считывании размера выборки

          read( unit = unit, fmt = * , iostat = stat ) gen_settings%read_N
          if ( stat .ne. 0_SP ) call gen_settings%log('WR_read_delta_t', file)

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание ответа на вопрос о считывании шага выборки

          read( unit = unit, fmt = * , iostat = stat ) gen_settings%read_delta_t
          if ( stat .ne. 0_SP ) call gen_settings%log('WR_read_delta_t', file)

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание ответа на вопрос о считывании уровня значимости

          read( unit = unit, fmt = * , iostat = stat ) gen_settings%read_q
          if ( stat .ne. 0_SP ) call gen_settings%log('WR_read_q', file)

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание ответа на вопрос о считывании параметра \alpha линейного тренда

          read( unit = unit, fmt = * , iostat = stat ) gen_settings%read_alpha
          if ( stat .ne. 0_SP ) call gen_settings%log('WR_read_alpha', file)

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание ответа на вопрос о считывании параметра \beta линейного тренда

          read( unit = unit, fmt = * , iostat = stat ) gen_settings%read_beta
          if ( stat .ne. 0_SP ) call gen_settings%log('WR_read_beta', file)

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание ответа на вопрос о считывании числа гармонических компонент

          read( unit = unit, fmt = * , iostat = stat ) gen_settings%read_r
          if ( stat .ne. 0_SP ) call gen_settings%log('WR_read_delta_t', file)

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание ответа на вопрос о считывании массива амплитуд

          read( unit = unit, fmt = * , iostat = stat ) gen_settings%read_A
          if ( stat .ne. 0_SP ) call gen_settings%log('WR_read_A', file)

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание ответа на вопрос о считывании массива частот

          read( unit = unit, fmt = * , iostat = stat ) gen_settings%read_v
          if ( stat .ne. 0_SP ) call gen_settings%log('WR_read_v', file)

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание ответа на вопрос о считывании массива фазовых сдвигов

          read( unit = unit, fmt = * , iostat = stat ) gen_settings%read_phi
          if ( stat .ne. 0_SP ) call gen_settings%log('WR_read_phi', file)

          ! Пропуск двух строк
          read( unit = unit, fmt = '(/)' )

          ! Считывание ответа на вопрос о считывании отношения «сигнал к шуму»

          read( unit = unit, fmt = * , iostat = stat ) gen_settings%read_gamma
          if ( stat .ne. 0_SP ) call gen_settings%log('WR_read_gamma', file)

          ! Закрытие файла
          close( unit = unit, iostat = stat )
          if ( stat .ne. 0_SP ) call gen_settings%log('WC', file)

     end procedure scats_gen_settings_read

end submodule scats_gen_settings_read_s