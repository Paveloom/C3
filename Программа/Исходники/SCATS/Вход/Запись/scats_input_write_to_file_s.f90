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
          if ( stat .ne. 0_SP ) call input%log('WO', file)

          if ( .not. allocated(input%t) ) call input%log('NA_t')
          if ( .not. allocated(input%x) ) call input%log('NA_x')

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
          if ( stat .ne. 0_SP ) call input%log('WC', file)

     end procedure scats_input_write_to_file

end submodule scats_input_write_to_file_s