submodule ( scats ) scats_remove_trend_s
implicit none

     contains

     ! Вспомогательная процедура для извлечения тренда из входных данных
     module procedure scats_remove_trend

          select case (type)

               case ('l') ! Линейный тренд

                    call scats_do_trend_remove_linear_trend(s%input, s%result)

               case default

                    write(*,'(/, 5x, a, /, 5x, a, /)') 'scats_remove_trend:', 'Неизвестный тип тренда ('//type//'). Доступные варианты: ''l''.'

                    stop

          end select

     end procedure scats_remove_trend

end submodule scats_remove_trend_s