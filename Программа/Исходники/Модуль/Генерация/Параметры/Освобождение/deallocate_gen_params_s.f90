submodule ( gen_params_m ) deallocate_gen_params_s
implicit none
     
     contains
     
     ! Процедура для освобождения памяти из-под параметров
     module procedure deallocate_gen_params
          
          integer(SP) :: stat ! Статусная переменная

          ! Освобождение памяти из-под массива амплитуд
          if ( allocated(gen_params%A) ) then
          
               deallocate( gen_params%A, stat = stat )
               if ( stat .ne. 0_SP ) call log_gen_params_error('WD_A')
               
          endif

          ! Освобождение памяти из-под массива амплитуд
          if ( allocated(gen_params%v) ) then
          
               deallocate( gen_params%v, stat = stat )
               if ( stat .ne. 0_SP ) call log_gen_params_error('WD_v')
               
          endif

          ! Освобождение памяти из-под массива амплитуд
          if ( allocated(gen_params%phi) ) then
          
               deallocate( gen_params%phi, stat = stat )
               if ( stat .ne. 0_SP ) call log_gen_params_error('WD_phi')
               
          endif
          
     end procedure deallocate_gen_params
     
end submodule deallocate_gen_params_s