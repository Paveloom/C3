submodule ( scats_do_trend_m ) scats_do_trend_remove_linear_trend_s
implicit none

     contains

     ! Процедура для удаления линейного тренда из входных данных
     module procedure scats_do_trend_remove_linear_trend

          real(RP) :: a, b ! Коэффициенты

          real(RP) :: SX  ! Сумма x_i-ых
          real(RP) :: SX2 ! Сумма x^2_i-ых
          real(RP) :: SY  ! Сумма y_i-ых
          real(RP) :: SXY ! Сумма (x_i * y_i)-ых

          integer(IP) :: N ! Размер выборки
          integer(JP) :: N_m1_JP ! Размер выборки - 1 (индекс)
          real(RP) :: N_RP ! Размер выборки (вещественное)

          ! Проверка на совпадение форм входных данных и результата
          call scats_do_check(input, result, call_stat)
          if ( call_stat ) return

          ! Распаковка входных данных
          associate( delta_t => input%delta_t, &
                   & q => input%q, &
                   & t => input%t, &
                   & x => input%x )

          ! Определение размера выборки
          N = size(t, kind=IP)

          ! Конвертации
          N_m1_JP = int(N, kind=JP) - 1_JP
          N_RP = real(N, kind=RP)

          ! Вычисление сумм
          SX  = sum(t)
          SX2 = sum(t ** 2)
          SY  = sum(x)
          SXY = sum(t * x)

          ! Вычисление коэффициента a
          a = ( SXY * N_RP - SY * SX ) / ( SX2 * N_RP - SX * SX )

          ! Вычисление коэффициента b
          b = ( SY - a * SX ) / N_RP

          ! Извлечение тренда
          result%x(0:) = x(0:) - ( a * t(0:) + b )

          ! Запись остальных данных
          result%q = q
          result%delta_t = delta_t
          result%t(0:) = t(0:)

          end associate

     end procedure scats_do_trend_remove_linear_trend

end submodule scats_do_trend_remove_linear_trend_s