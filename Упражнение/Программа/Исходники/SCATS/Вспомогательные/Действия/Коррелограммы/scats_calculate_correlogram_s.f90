submodule ( scats ) scats_calculate_correlogram_s
implicit none

     contains

     ! Вспомогательная процедура для вычисления коррелограммы
     module procedure scats_calculate_correlogram

          logical :: call_stat ! Статусная переменная процедуры
          call_stat = .false.

          if ( present(use_input) ) then

               if ( use_input ) then

                    ! Вызов процедуры для вычисления коррелограммы
                    call scats_do_correlogram_calculate(s%result, call_stat, s%input)

               else

                    ! Вызов процедуры для вычисления коррелограммы
                    call scats_do_correlogram_calculate(s%result, call_stat)

               endif

          else

               ! Вызов процедуры для вычисления коррелограммы
               call scats_do_correlogram_calculate(s%result, call_stat)

          endif

          if ( call_stat ) then

               call s%deallocate()
               stop

          endif

     end procedure scats_calculate_correlogram

end submodule scats_calculate_correlogram_s