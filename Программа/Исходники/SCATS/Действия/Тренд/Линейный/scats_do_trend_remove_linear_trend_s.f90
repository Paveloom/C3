submodule ( scats_do_trend_m ) scats_do_trend_remove_linear_trend_s
implicit none
     
     contains
     
     ! Процедура для удаления линейного тренда из входных данных
     module procedure scats_do_trend_remove_linear_trend

          real(RP) :: a, b ! Коэффициенты

          real(RP) :: X  ! Сумма x_i-ых
          real(RP) :: X2 ! Сумма x^2_i-ых
          real(RP) :: Y  ! Сумма y_i-ых
          real(RP) :: XY ! Сумма (x_i * y_i)-ых

          integer(IP) :: N ! Размер выборки
          integer(JP) :: N_m1_JP ! Размер выборки - 1 (индекс)
          real(RP) :: N_RP ! Размер выборки (вещественное)

          ! Проверка на совпадение форм входных данных и результата
          call scats_do_check(input, result)

          ! Определение размера выборки
          N = size(input%t, kind=IP)

          ! Конвертации
          N_m1_JP = int(N, kind=JP) - 1_JP
          N_RP = real(N, kind=RP)
               
          ! Вычисление сумм
          X  = sum(input%t)
          X2 = sum(input%t ** 2)
          Y  = sum(input%x)
          XY = sum(input%t * input%x)

          ! Вычисление коэффициента a
          a = ( XY * N_RP - Y * X ) / ( X2 * N_RP - X * X )

          ! Вычисление коэффициента b
          b = ( Y - a * X ) / N_RP

          ! Извлечение тренда
          result%x(0:) = input%x(0:) - ( a * input%t(0:) + b )

          ! Запись остальных данных
          result%delta_t = input%delta_t
          result%t(0:) = input%t(0:)

     end procedure scats_do_trend_remove_linear_trend
     
end submodule scats_do_trend_remove_linear_trend_s