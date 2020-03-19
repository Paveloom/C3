submodule ( scats_do_trend_m ) scats_do_trend_remove_linear_trend_s
implicit none
     
     contains
     
     ! Процедура для удаления линейного тренда из входных данных
     module procedure scats_do_trend_remove_linear_trend

          real(RP), dimension(:), pointer :: t_pt ! Массив времени
          real(RP), dimension(:), pointer :: x_pt ! Массив значений
          real(RP), dimension(:), allocatable :: x_new ! Массив измененных значений

          real(RP) :: a, b ! Коэффициенты

          real(RP) :: X  ! Сумма x_i-ых
          real(RP) :: X2 ! Сумма x^2_i-ых
          real(RP) :: Y  ! Сумма y_i-ых
          real(RP) :: XY ! Сумма (x_i * y_i)-ых

          integer(IP) :: N ! Размер выборки
          integer(JP) :: N_m1_JP ! Размер выборки - 1 (индекс)
          real(RP) :: N_RP ! Размер выборки (вещественное)

          integer(SP) :: stat ! Статусная переменная

          ! Проверка на совпадение форм входных данных и результата
          call scats_do_check(input, result)

          ! Распаковка данных
          t_pt => input%get_t_pt()
          x_pt => input%get_x_pt()

          ! Определение размера выборки
          N = size(t_pt, kind=IP)

          ! Конвертации
          N_m1_JP = int(N, kind=JP) - 1_JP
          N_RP = real(N, kind=RP)
               
          ! Вычисление сумм
          X  = sum(t_pt)
          X2 = sum(t_pt ** 2)
          Y  = sum(x_pt)
          XY = sum(t_pt * x_pt)

          ! Вычисление коэффициента a
          a = ( XY * N_RP - Y * X ) / ( X2 * N_RP - X * X )

          ! Вычисление коэффициента b
          b = ( Y - a * X ) / N_RP

          ! Выделение памяти под массив новых значений
          allocate( x_new(0:N_m1_JP), stat = stat )
          if ( stat .ne. 0_SP ) call scats_log_do_error('WA_Nx')

          ! Извлечение тренда
          x_new(0:) = x_pt(0:) - ( a * t_pt(0:) + b )

          ! Запись результата
          call result%put_delta_t(input%get_delta_t_pt())
          call result%put_t(t_pt(0:))
          call result%put_x(x_new(0:))

          ! Освобождение памяти из-под массива новых значений
          deallocate( x_new, stat = stat )
          if ( stat .ne. 0_SP ) call scats_log_do_error('WD_Nx')

     end procedure scats_do_trend_remove_linear_trend
     
end submodule scats_do_trend_remove_linear_trend_s