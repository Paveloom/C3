submodule ( scats_gen_params_m ) scats_gen_params_deallocate_s
implicit none

     contains

     ! Процедура для освобождения памяти из-под параметров
     module procedure scats_gen_params_deallocate

          integer(SP) :: stat ! Статусная переменная

          ! Освобождение памяти из-под массива амплитуд
          if ( allocated(gen_params%A) ) then

               deallocate( gen_params%A, stat = stat )
               if ( stat .ne. 0_SP ) call scats_gen_params_log_error('WD_A')

          endif

          ! Освобождение памяти из-под массива частот
          if ( allocated(gen_params%v) ) then

               deallocate( gen_params%v, stat = stat )
               if ( stat .ne. 0_SP ) call scats_gen_params_log_error('WD_v')

          endif

          ! Освобождение памяти из-под массива фазовых сдвигов
          if ( allocated(gen_params%phi) ) then

               deallocate( gen_params%phi, stat = stat )
               if ( stat .ne. 0_SP ) call scats_gen_params_log_error('WD_phi')

          endif

     end procedure scats_gen_params_deallocate

end submodule scats_gen_params_deallocate_s