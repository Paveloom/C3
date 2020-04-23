submodule ( scats ) scats_write_result_s
implicit none

     contains

     ! Вспомогательная процедура для записи результата в файл
     module procedure scats_write_result

          logical call_stat ! Статусная переменная процедуры
          call_stat = .false.

          call s%result%write(file, call_stat)

          if ( call_stat ) then

               call s%deallocate()
               stop

          endif

     end procedure scats_write_result

end submodule scats_write_result_s