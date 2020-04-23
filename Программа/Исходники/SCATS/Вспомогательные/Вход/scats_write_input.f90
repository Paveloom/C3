submodule ( scats ) scats_write_input_s
implicit none

     contains

     ! Вспомогательная процедура для записи входных данных в файл
     module procedure scats_write_input

          logical :: call_stat ! Статусная переменная процедуры
          call_stat = .false.

          call s%input%write(file, call_stat)

          if ( call_stat ) then

               call s%deallocate()
               stop

          endif

     end procedure scats_write_input

end submodule scats_write_input_s