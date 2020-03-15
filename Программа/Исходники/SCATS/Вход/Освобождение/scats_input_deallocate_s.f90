submodule ( scats_input_m ) scats_input_deallocate_s
implicit none
     
     contains
     
     ! Процедура освобождения памяти из-под входных данных
     module procedure scats_input_deallocate
          
          integer(SP) :: stat ! Статусная переменная

          ! Освобождение памяти из-под массива времени
          if ( allocated(input%t) ) then
          
               deallocate( input%t, stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_input_error('WD_t')
               
          endif

          ! Освобождение памяти из-под массива значений
          if ( allocated(input%x) ) then
          
               deallocate( input%x, stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_input_error('WD_x')
               
          endif

     end procedure scats_input_deallocate
     
end submodule scats_input_deallocate_s