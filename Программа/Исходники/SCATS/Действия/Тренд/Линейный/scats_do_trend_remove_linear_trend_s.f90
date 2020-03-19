submodule ( scats_do_trend_m ) scats_do_trend_remove_linear_trend_s
implicit none
     
     contains
     
     ! Процедура для удаления линейного тренда из входных данных
     module procedure scats_do_trend_remove_linear_trend
          
          ! Проверка на совпадение форм входных данных и результата
          call scats_do_trend_check(input, result)
          
     end procedure scats_do_trend_remove_linear_trend
     
end submodule scats_do_trend_remove_linear_trend_s