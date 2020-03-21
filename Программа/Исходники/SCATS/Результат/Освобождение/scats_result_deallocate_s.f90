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

          ! Освобождение памяти из-под результата преобразования Фурье
          if ( allocated(result%X_FFT) ) then
          
               deallocate( result%X_FFT, stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_result_error('WD_X_FFT')
               
          endif

          ! Освобождение памяти из-под массива частот периодограммы
          if ( allocated(result%v) ) then
          
               deallocate( result%v, stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_result_error('WD_v')
               
          endif
          
          ! Освобождение памяти из-под массива значений периодограммы
          if ( allocated(result%D) ) then
          
               deallocate( result%D, stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_result_error('WD_D')
               
          endif

     end procedure scats_result_deallocate
     
end submodule scats_result_deallocate_s