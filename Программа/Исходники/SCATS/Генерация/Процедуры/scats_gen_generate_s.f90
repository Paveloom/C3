submodule ( scats_gen_m ) scats_gen_generate_s
implicit none

     contains

     ! Процедура для генерации временного ряда
     module procedure scats_gen_generate

          integer(SP) :: stat ! Статусная переменная

          ! Массив значений случайных чисел
          real(RP), allocatable, dimension(:) :: rand

          ! Дополнительные переменные
          real(RP) :: t ! Текущее значение времени
          real(RP) :: c ! Текущее значение суммы
          real(RP) :: std ! Стандартное отклонение

          ! Вспомогательные переменные
          integer(JP) :: N_JP ! Значение N (для индекса)
          integer(IP) :: N_m1 ! Значение N - 1
          integer(JP) :: N_m1_JP ! Значение N - 1 (для индекса)
          integer(JP) :: r_JP ! Значение r (для индекса)
          integer(JP) :: k ! Счетчик 1
          integer(JP) :: l ! Счетчик 2
          real(RP) :: k_RP ! Овеществление счетчика

          ! Проверка, активирован ли генератор
          if (.not. gen%params%ready) call scats_log_gen_error('NA')

          ! Распаковка параметров генератора
          associate( N => gen%params%N, &
                   & delta_t => gen%params%delta_t, &
                   & q => gen%params%q, &
                   & alpha => gen%params%alpha, &
                   & beta => gen%params%beta, &
                   & r => gen%params%r, &
                   & A => gen%params%A, &
                   & v => gen%params%v, &
                   & phi => gen%params%phi, &
                   & gamma => gen%params%gamma )

          ! Сохранение значение шага выборки
          input%delta_t = delta_t

          ! Сохранение значения уровня значимости
          input%q = q

          ! Вычисление стандартного отклонения
          std = sqrt(sum(A * A) / (2._RP * gamma))

          ! Вычисление вспомогательной переменной
          N_m1 = N - 1_IP

          ! Конвертации для индексов
          N_JP = int(N, kind=JP)
          N_m1_JP = int(N_m1, kind=JP)
          r_JP = int(r, kind=JP)

          ! Выделение памяти под массивы

          if ( allocated(input%t) ) then

               if ( .not. size(input%t, kind=IP) .eq. N ) then

                    ! Освобождение памяти из-под массива времени
                    deallocate( input%t, stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_gen_error('WD_t')

                    ! Выделение памяти под массив времени
                    allocate( input%t(0:N_m1_JP), stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_gen_error('WA_t')

               endif

          else

               ! Выделение памяти под массив времени
               allocate( input%t(0:N_m1_JP), stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_gen_error('WA_t')

          endif

          if ( allocated(input%x) ) then

               if ( .not. size(input%x, kind=IP) .eq. N ) then

                    ! Освобождение памяти из-под массива значений
                    deallocate( input%x, stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_gen_error('WD_x')

                    ! Выделение памяти под массив значений
                    allocate( input%x(0:N_m1_JP), stat = stat )
                    if ( stat .ne. 0_SP ) call scats_log_gen_error('WA_x')

               endif

          else

               ! Выделение памяти под массив значений
               allocate( input%x(0:N_m1_JP), stat = stat )
               if ( stat .ne. 0_SP ) call scats_log_gen_error('WA_x')

          endif

          allocate( rand(0:N_m1_JP), stat = stat )
          if ( stat .ne. 0_SP ) call scats_log_gen_error('WA_rand')

          ! Генерация массива случайных чисел
          call scats_generate_random_array(N_JP, rand)

          ! Генерация временного ряда

          do k = 0_JP, N_m1_JP

               k_RP = real(k, kind=RP)

               t = delta_t * k_RP
               input%t(k) = t

               c = alpha + beta * t

               do l = 1_JP, r_JP

                    c = c + A(l) * cos(2._RP * pi * v(l) * t - phi(l))

               enddo

               c = c + rand(k)

               input%x(k) = c

          enddo

          deallocate( rand, stat = stat )
          if ( stat .ne. 0_SP ) call scats_log_gen_error('WD_rand')

          end associate

     end procedure scats_gen_generate

end submodule scats_gen_generate_s