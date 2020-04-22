submodule ( scats ) scats_generate_s
implicit none

     contains

     ! Вспомогательная процедура для вызова генератора временного ряда
     module procedure scats_generate

          ! Ответы на вопросы
          logical :: q1, q2

          ! Статусная переменная процедуры
          logical :: call_stat
          call_stat = .false.

          ! Проверка, указан ли аргумент add_trend
          if ( .not. present(add_trend) ) then

               q1 = .true.

          else

               q1 = add_trend

          endif

          ! Проверка, указан ли аргумент add_noise
          if ( .not. present(add_noise) ) then

               q2 = .true.

          else

               q2 = add_noise

          endif

          ! Вызов процедуры для генерации временного ряда
          call s%gen%generate(s%input, q1, q2, call_stat)

          if ( call_stat ) then

               call s%deallocate()
               stop

          endif

     end procedure scats_generate

end submodule scats_generate_s