submodule ( scats_input_m ) scats_input_read_s
implicit none
     
     contains
     
     ! Процедура для считывания входных данных
     module procedure scats_input_read
          
          integer(SP) :: stat ! Статусная переменная
          integer(UP) :: unit ! Номер дескриптора файла

          ! Открытие файла
          open( newunit = unit, file = file, action = 'read', status = 'old', iostat = stat)
          if ( stat .ne. 0_SP ) call scats_log_input_error('WO', file) ! Проверка на ошибку открытия файла
          
          read( unit = unit, fmt = *, iostat = stat ) input%t
          if ( stat .ne. 0_SP ) call scats_log_input_error('WR_t', file)

          read( unit = unit, fmt = *, iostat = stat ) input%x
          if ( stat .ne. 0_SP ) call scats_log_input_error('WR_x', file)

          ! Закрытие файла
          close( unit = unit, iostat = stat )
          if ( stat .ne. 0_SP ) call scats_log_input_error('WC', file) ! Проверка на ошибку закрытия файла

     end procedure scats_input_read
     
end submodule scats_input_read_s