submodule ( scats ) scats_generate_s
implicit none
     
     contains
     
     ! Вспомогательная процедура для вызова генератора временного ряда
     module procedure scats_generate
          
          call s%gen%generate(s%input)
          
     end procedure scats_generate
     
end submodule scats_generate_s