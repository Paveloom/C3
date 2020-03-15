submodule ( scats_input_m ) scats_input_write_to_file_s
implicit none
     
     contains
     
     ! Процедура для записи входных данных в файл
     module procedure scats_input_write_to_file
          
          integer(SP) :: stat ! Статусная переменная
          integer(UP) :: unit ! Номер дескриптора файла

          ! Открытие файла
          open( newunit = unit, file = file, action = 'write', status = 'replace', iostat = stat)
          if ( stat .ne. 0_SP ) call scats_log_input_error('WO', file) ! Проверка на ошибку открытия файла

          if ( allocated(input%t) ) then

               ! Запись массива времени
               write(unit,'(*('//RF//', 3x))' ) input%t

          else

               call scats_log_input_error('NA_t', file)

          endif

          if ( allocated(input%t) ) then

               ! Запись массива значений
               write(unit, '(*('//RF//', 3x))') input%x

          else

               call scats_log_input_error('NA_t', file)

          endif

          ! Закрытие файла
          close( unit = unit, iostat = stat )
          if ( stat .ne. 0_SP ) call scats_log_input_error('WC', file) ! Проверка на ошибку закрытия файла
          
     end procedure scats_input_write_to_file
     
end submodule scats_input_write_to_file_s