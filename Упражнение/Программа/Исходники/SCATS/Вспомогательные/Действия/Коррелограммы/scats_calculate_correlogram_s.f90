submodule ( scats ) scats_calculate_correlogram_s
implicit none

     contains

     ! Вспомогательная процедура для вычисления коррелограммы
     module procedure scats_calculate_correlogram

          if ( present(use_input) ) then

               if ( use_input ) then

                    ! Вызов процедуры для вычисления коррелограммы
                    call scats_do_correlogram_calculate(s%result, s%input)

               else

                    ! Вызов процедуры для вычисления коррелограммы
                    call scats_do_correlogram_calculate(s%result)

               endif

          else

               ! Вызов процедуры для вычисления коррелограммы
               call scats_do_correlogram_calculate(s%result)

          endif

     end procedure scats_calculate_correlogram

end submodule scats_calculate_correlogram_s