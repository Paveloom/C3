submodule ( scats ) scats_calculate_periodogram_s
implicit none

     contains

     ! Вспомогательная процедура для вычисления периодограммы
     module procedure scats_calculate_periodogram

          logical :: call_stat ! Статусная переменная процедуры
          call_stat = .false.

          ! Проверка на указание использовать входные
          ! данные вместо данных из результата
          if ( present(use_input) ) then

               if ( use_input ) then

                    ! Вызов процедуры для вычисления периодограммы
                    call scats_do_periodogram_calculate(s%result, call_stat, s%input)

               else

                    ! Вызов процедуры для вычисления периодограммы
                    call scats_do_periodogram_calculate(s%result, call_stat)

               endif

          else

               ! Вызов процедуры для вычисления периодограммы
               call scats_do_periodogram_calculate(s%result, call_stat)

          endif

          if ( call_stat ) then

               call s%deallocate()
               stop

          endif

     end procedure scats_calculate_periodogram

end submodule scats_calculate_periodogram_s