submodule ( scats ) scats_remove_linear_trend_s
implicit none

     contains

     ! Вспомогательная процедура для вызова процедуры,
     ! извлекающей линейный тренд из данных
     module procedure scats_remove_linear_trend

          call scats_do_trend_remove_linear_trend(s%input, s%result)

     end procedure scats_remove_linear_trend

end submodule scats_remove_linear_trend_s