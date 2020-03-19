submodule ( scats_result_m ) scats_result_deallocate_s
implicit none
     
     contains
     
     ! Процедура для освобождения памяти из-под результата
     module procedure scats_result_deallocate
          
          integer(SP) :: stat ! Статусная переменная

          ! Освобождение памяти из-под массива времени
          if ( allocated(result%t) ) then
          
               deallocate( result%t, stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_result_error('WD_t')
               
          endif

          ! Освобождение памяти из-под массива значений
          if ( allocated(result%x) ) then
          
               deallocate( result%x, stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_result_error('WD_x')
               
          endif
          
     end procedure scats_result_deallocate
     
end submodule scats_result_deallocate_s