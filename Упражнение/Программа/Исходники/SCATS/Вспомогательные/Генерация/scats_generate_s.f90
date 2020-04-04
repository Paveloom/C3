submodule ( scats ) scats_generate_s
implicit none

     contains

     ! Вспомогательная процедура для вызова генератора временного ряда
     module procedure scats_generate

          ! Ответы на вопросы
          logical(kind(.true.)) :: q1, q2

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
          call s%gen%generate(s%input, q1, q2)

     end procedure scats_generate

end submodule scats_generate_s