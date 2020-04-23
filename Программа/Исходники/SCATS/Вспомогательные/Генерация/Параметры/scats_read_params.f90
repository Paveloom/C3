submodule ( scats ) scats_read_params_s
implicit none

     contains

     ! Вспомогательная процедура для считывания параметров генератора
     module procedure scats_read_params

          logical call_stat ! Статус вызова процедуры
          call_stat = .false.

          call s%gen%params%read(file, call_stat)

          if ( call_stat ) then

               call s%deallocate()
               stop

          endif

     end procedure scats_read_params

end submodule scats_read_params_s