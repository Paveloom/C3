submodule ( scats_result_m ) scats_result_deallocate_s
implicit none

     contains

     ! Процедура для освобождения памяти из-под результата
     module procedure scats_result_deallocate

          integer(SP) :: stat ! Статусная переменная

          ! Освобождение памяти из-под массива времени
          if ( allocated(result%t) ) then

               deallocate( result%t, stat = stat )
               if ( stat .ne. 0_SP ) call result%log('WD_t')

          endif

          ! Освобождение памяти из-под массива значений
          if ( allocated(result%x) ) then

               deallocate( result%x, stat = stat )
               if ( stat .ne. 0_SP ) call result%log('WD_x')

          endif

          ! Освобождение памяти из-под квадрата преобразованных значений
          if ( allocated(result%X_FFT_ABS) ) then

               deallocate( result%X_FFT_ABS, stat = stat )
               if ( stat .ne. 0_SP ) call result%log('WD_X_FFT_ABS')

          endif

          ! Освобождение памяти из-под массива частот периодограммы
          if ( allocated(result%v) ) then

               deallocate( result%v, stat = stat )
               if ( stat .ne. 0_SP ) call result%log('WD_v')

          endif

          ! Освобождение памяти из-под массива значений периодограммы
          if ( allocated(result%D) ) then

               deallocate( result%D, stat = stat )
               if ( stat .ne. 0_SP ) call result%log('WD_D')

          endif

          ! Освобождение памяти из-под массива значений коррелограммы
          if ( allocated(result%c) ) then

               deallocate( result%c, stat = stat )
               if ( stat .ne. 0_SP ) call result%log('WD_c')

          endif

          ! Освобождение памяти из-под массива значений взвешенной коррелограммы
          if ( allocated(result%cw) ) then

               deallocate( result%cw, stat = stat )
               if ( stat .ne. 0_SP ) call result%log('WD_cw')

          endif

          ! Освобождение памяти из-под массива значений сглаженной периодограммы
          if ( allocated(result%Dw) ) then

               deallocate( result%Dw, stat = stat )
               if ( stat .ne. 0_SP ) call result%log('WD_Dw')

          endif

     end procedure scats_result_deallocate

end submodule scats_result_deallocate_s