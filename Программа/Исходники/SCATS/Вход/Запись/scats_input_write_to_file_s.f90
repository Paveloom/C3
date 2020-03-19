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
          if ( stat .ne. 0_SP ) call scats_log_input_error('WO', file) ! Проверка на ошибку открытия файла

          if ( .not. allocated(input%t) ) then

               call scats_log_input_error('NA_t', file)

          else if ( .not. allocated(input%x) ) then

               call scats_log_input_error('NA_t', file)

          else

               ! Запись размера выборки
               write( unit, '(a)' ) 'Размер выборки'
               write( f, '(i10)' ) size(input%t)
               write( unit, '(a, /)' ) trim(adjustl(f))

               ! Запись массива времени
               write( unit, '(a)' ) 'Массив времени'
               write( unit, '(*('//RF//', 3x))' ) input%t
               write( unit, '()')

               ! Запись массива значений
               write( unit, '(a)' ) 'Массив значений'
               write( unit, '(*('//RF//', 3x))') input%x
               write( unit, '()')

          endif

          ! Закрытие файла
          close( unit = unit, iostat = stat )
          if ( stat .ne. 0_SP ) call scats_log_input_error('WC', file) ! Проверка на ошибку закрытия файла
          
     end procedure scats_input_write_to_file
     
end submodule scats_input_write_to_file_s