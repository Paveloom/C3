submodule ( scats ) scats_deallocate_s
implicit none
     
     contains
     
     ! Процедура для общего освобождения памяти
     module procedure scats_deallocate
          
          ! Освобождение памяти из-под параметров
          call s%gen%params%deallocate()

          ! Освобождение памяти из-под входных данных
          call s%input%deallocate()

          ! Освобождение памяти из-под результата
          call s%result%deallocate()
          
     end procedure scats_deallocate
     
end submodule scats_deallocate_s