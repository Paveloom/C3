submodule ( scats_gen_m ) scats_gen_generate_s
implicit none
     
     contains
     
     ! Процедура для вызова генератора временного ряда
     module procedure scats_gen_generate

          integer(SP) :: stat ! Статусная переменная

          ! Содержимое объекта типа gen_params_type

          integer(IP), pointer :: N_pt ! Указатель на размер выборки

          real(RP), pointer :: delta_t_pt ! Указатель на шаг выборки
          real(RP), pointer :: q_pt ! Указатель на уровень значимости
          real(RP), pointer :: alpha_pt, beta_pt ! Указатель на параметры линейного тренда
          
          integer(IP), pointer :: r_pt ! Указатель на число гармонических компонент

          real(RP), dimension(:), pointer :: A_pt ! Указатель на массив амплитуд
          real(RP), dimension(:), pointer :: v_pt ! Указатель на массив частот
          real(RP), dimension(:), pointer :: phi_pt ! Указатель на массив фазовых сдвигов

          real(RP), pointer :: gamma_pt ! Указатель на отношение «сигнал к шуму»

          ! Дополнительные переменные
          real(RP) :: t ! Текущее значение времени
          real(RP) :: c ! Текущее значение суммы
          real(RP) :: pi ! Значение числа pi

          ! Вспомогательные переменные
          integer(IP) :: N_m1 ! Значение N - 1
          integer(JP) :: N_m1_JP ! Значение N - 1 (для индекса)
          integer(JP) :: r_JP ! Значение r (для индекса)
          integer(JP) :: k ! Счетчик 1
          integer(JP) :: l ! Счетчик 2
          real(RP) :: k_RP ! Овеществление счетчика 

          ! Вычисление числа pi
          pi = 4._RP * atan(1._RP)
          
          ! Распаковка параметров генератора

          N_pt => gen%params%get_N_pt()

          delta_t_pt => gen%params%get_delta_t_pt()
          q_pt => gen%params%get_q_pt()
          alpha_pt => gen%params%get_alpha_pt()
          beta_pt => gen%params%get_beta_pt()

          r_pt => gen%params%get_r_pt()

          A_pt => gen%params%get_A_pt()
          v_pt => gen%params%get_v_pt()
          phi_pt => gen%params%get_phi_pt()

          gamma_pt => gen%params%get_gamma_pt()
          
          ! Вычисление вспомогательной переменной
          N_m1 = N_pt - 1_IP

          ! Конвертации для индексов
          N_m1_JP = int(N_m1, kind=JP)
          r_JP = int(r_pt, kind=JP)

          ! Выделение памяти под массивы

          if ( .not. allocated(input%t) ) then

               allocate( input%t(0:N_m1_JP), stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_gen_error('WA_t') ! Проверка на ошибку выделения памяти

          endif

          if ( .not. allocated(input%x) ) then

               allocate( input%x(0:N_m1_JP), stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_gen_error('WA_x') ! Проверка на ошибку выделения памяти

          endif

          ! Генерация временного ряда

          do k = 0_JP, N_m1_JP

               k_RP = real(k, kind=RP)

               t = delta_t_pt * k_RP
               input%t(k) = t

               c = alpha_pt + beta_pt * t

               do l = 1_JP, r_JP

                    c = A_pt(l) * cos(2._RP * pi * v_pt(l) * t - phi_pt(l))

               enddo

               input%x(k) = c

          enddo

          deallocate(input%t)
          deallocate(input%x)
          
     end procedure scats_gen_generate
     
end submodule scats_gen_generate_s