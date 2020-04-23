submodule ( scats ) scats_calculate_weighted_correlogram_s
implicit none

     contains

     ! Вспомогательная процедура для вычисления взвешенной коррелограммы
     module procedure scats_calculate_weighted_correlogram

          logical :: call_stat ! Статусная переменная процедуры
          call_stat = .false.

          ! Вызов процедуры для вычисления взвешенной коррелограммы
          call scats_do_correlogram_calculate_w(s%result, nfactor, a, call_stat)

          if ( call_stat ) then

               call s%deallocate()
               stop

          endif

     end procedure scats_calculate_weighted_correlogram

end submodule scats_calculate_weighted_correlogram_s