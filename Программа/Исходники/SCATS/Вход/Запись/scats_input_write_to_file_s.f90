submodule ( scats_input_m ) scats_input_write_to_file_s
implicit none

     contains

     ! Процедура для записи входных данных в файл
     module procedure scats_input_write_to_file

          integer(SP) :: stat ! Статусная переменная
          integer(UP) :: unit ! Номер дескриптора файла

          character(FP) :: f ! Вспомогательная строка

          ! Открытие файла
          open( newunit = unit, file = file, action = 'write', status = 'replace', iostat = stat)
          if ( stat .ne. 0_SP ) then; call scats_input_log_error('WO', file, call_stat); return; endif

          if ( .not. allocated(input%t) ) then; call scats_input_log_error('NA_t', call_stat=call_stat); return; endif
          if ( .not. allocated(input%x) ) then; call scats_input_log_error('NA_x', call_stat=call_stat); return; endif

          ! Запись размера выборки
          write( unit, '(a)' ) 'Размер выборки'
          write( f, '(i10)' ) size(input%t)
          write( unit, '(a, /)' ) trim(adjustl(f))

          ! Запись шага выборки
          write( unit, '(a)' ) 'Шаг выборки'
          write( unit, '('//RF//', /)' ) input%delta_t

          ! Запись уровня значимости
          write( unit, '(a)' ) 'Уровень значимости'
          write( unit, '('//RF//', /)' ) input%q

          ! Запись массива времени
          write( unit, '(a)' ) 'Массив времени'
          write( unit, '(*('//RF//', 3x))' ) input%t
          write( unit, '()')

          ! Запись массива значений
          write( unit, '(a)' ) 'Массив значений'
          write( unit, '(*('//RF//', 3x))') input%x

          ! Закрытие файла
          close( unit = unit, iostat = stat )
          if ( stat .ne. 0_SP ) then; call scats_input_log_error('WC', file, call_stat); return; endif

     end procedure scats_input_write_to_file

end submodule scats_input_write_to_file_s