submodule ( scats ) scats_read_gen_settings_s
implicit none

     contains

     ! Вспомогательная процедура для считывания настроек считывания параметров
     module procedure scats_read_gen_settings

          logical call_stat ! Статусная переменная процедуры
          call_stat = .false.

          call s%gen%params%settings%read(file, call_stat)

          if ( call_stat ) then

               call s%deallocate()
               stop

          endif

     end procedure scats_read_gen_settings

end submodule scats_read_gen_settings_s