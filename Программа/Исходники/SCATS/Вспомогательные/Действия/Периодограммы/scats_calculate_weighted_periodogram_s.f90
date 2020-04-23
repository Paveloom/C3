submodule ( scats ) scats_calculate_weighted_periodogram_s
implicit none

     contains

     ! Вспомогательная процедура для вычисления взвешенной периодограммы
     module procedure scats_calculate_weighted_periodogram

          logical :: call_stat ! Статусная переменная процедуры
          call_stat = .false.

          ! Вызов процедуры для вычисления взвешенной периодограммы
          call scats_do_periodogram_calculate_w(s%result, call_stat)

          if ( call_stat ) then

               call s%deallocate()
               stop

          endif

     end procedure scats_calculate_weighted_periodogram

end submodule scats_calculate_weighted_periodogram_s