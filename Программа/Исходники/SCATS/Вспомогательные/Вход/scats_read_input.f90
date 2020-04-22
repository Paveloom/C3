submodule ( scats ) scats_read_input_s
implicit none

     contains

     ! Вспомогательная процедура для считывания входных данных
     module procedure scats_read_input

          logical :: call_stat ! Статусная переменная процедуры
          call_stat = .false.

          call s%input%read(file, call_stat)

          if ( call_stat ) then

               call s%deallocate()
               stop

          endif

     end procedure scats_read_input

end submodule scats_read_input_s