submodule ( scats_result_m ) scats_result_write_to_file_s
implicit none
     
     contains
     
     ! Процедура для записи результата в файл
     module procedure scats_result_write_to_file
          
          integer(SP) :: stat ! Статусная переменная
          integer(UP) :: unit ! Номер дескриптора файла

          character(FP) :: f ! Вспомогательная строка

          ! Открытие файла
          open( newunit = unit, file = file, action = 'write', status = 'replace', iostat = stat)
          if ( stat .ne. 0_SP ) call scats_log_result_error('WO', file) ! Проверка на ошибку открытия файла

          if ( .not. allocated(result%t) ) then

               call scats_log_result_error('NA_t', file)

          else if ( .not. allocated(result%x) ) then

               call scats_log_result_error('NA_x', file)

          endif

          ! Запись размера выборки
          write( unit, '(a)' ) 'Размер выборки'
          write( f, '(i10)' ) size(result%t)
          write( unit, '(a, /)' ) trim(adjustl(f))

          ! Запись шага выборки
          write( unit, '(a)' ) 'Шаг выборки'
          write( unit, '('//RF//', /)' ) result%delta_t

          ! Запись массива времени
          write( unit, '(a)' ) 'Массив времени'
          write( unit, '(*('//RF//', 3x))' ) result%t
          write( unit, '()')

          ! Запись массива значений
          write( unit, '(a)' ) 'Массив значений'
          write( unit, '(*('//RF//', 3x))') result%x
          write( unit, '()')

          ! Запись уровня значимости
          write( unit, '(a)' ) 'Уровень значимости'
          write( unit, '(*('//RF//', 3x))') result%q
          write( unit, '()')

          ! Запись порога обнаружения сигнала
          write( unit, '(a)' ) 'Порог обнаружения сигнала'
          write( unit, '(*('//RF//', 3x))') result%threshold

          if ( allocated(result%v) ) then

               ! Запись массива частот периодограммы
               write( unit, '()')
               write( unit, '(a)' ) 'Массив частот периодограммы'
               write( unit, '(*('//RF//', 3x))') result%v

          endif

          if ( allocated(result%D) ) then

               ! Запись массива значений периодограммы
               write( unit, '()')
               write( unit, '(a)' ) 'Массив значений периодограммы'
               write( unit, '(*('//RF//', 3x))') result%D

          endif

          if ( allocated(result%c) ) then

               ! Запись массива значений коррелограммы
               write( unit, '()')
               write( unit, '(a)' ) 'Массив значений коррелограммы'
               write( unit, '(*('//RF//', 3x))') result%c

          endif

          ! Закрытие файла
          close( unit = unit, iostat = stat )
          if ( stat .ne. 0_SP ) call scats_log_result_error('WC', file) ! Проверка на ошибку закрытия файла
          
     end procedure scats_result_write_to_file
     
end submodule scats_result_write_to_file_s