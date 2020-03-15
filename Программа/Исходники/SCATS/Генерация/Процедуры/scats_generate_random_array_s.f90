submodule ( scats_gen_m ) scats_generate_random_array_s
implicit none
     
     contains
     
     ! Процедура для генерации массива значений нормально распределенных случайных величин
     module procedure scats_generate_random_array

          ! Стандартное нормальное распределение:
          ! математическое ожидание = 0, 
          ! среднеквадратическое отклонение = 1.

          integer(JP) :: half ! Половина от длины массива случайных чисел

          real(RP) :: s ! Сумма квадратов случайных величин ~ U[0, 1)
          real(RP) :: fac ! Фактор перед r1 и r2 

          real(RP) :: r1, r2 ! Случайные величина ~ U[-1, 1)
          real(RP) :: rr1, rr2 ! Случайные величины ~ U[0, 1)

          integer(JP) :: i ! Счетчик
          integer(JP) :: i1, i2 ! Индексы

          ! Вычисление половины от N
          half = length / 2_JP

          if (mod(length, 2_JP) .eq. 0_JP) then

               do i = 0_JP, half - 1_JP

                    ! Вычисление индексов
                    i1 = i * 2_JP
                    i2 = i1 + 1_JP

                    ! Начальное значение суммы для срабатывания цикла
                    s = 2._RP

                    ! Инициализация начальных значений r1 и r2
                    r1 = 1._RP; r2 = 1._RP

                    do while( (s .gt. 1._RP) .or. (s .lt. 1e-8_RP) )

                         ! Получение значений случайных величин на полуинтервале [0, 1)
                         rr1 = scats_generate_random_uniform()
                         rr2 = scats_generate_random_uniform()

                         ! Проверка на их малость
                         if (abs(rr1) .lt. 1e-8_RP) rr1 = 0._RP
                         if (abs(rr2) .lt. 1e-8_RP) rr2 = 0._RP

                         ! Получение значений случайных величин на отрезке [-1, 1)
                         r1 = 2._RP * rr1 - 1._RP
                         r2 = 2._RP * rr2 - 1._RP

                         ! Вычисление суммы квадратов
                         s = r1 * r1 + r2 * r2

                    enddo

                    ! Вычисление фактора
                    fac = sqrt(-2._RP * log(s) / s)

                    ! Вычисление случайных величин
                    array(i1) = r1 * fac
                    array(i2) = r2 * fac

               enddo

          else

               do i = 0_JP, half - 1_JP

                    ! Вычисление индексов
                    i1 = i * 2_JP
                    i2 = i1 + 1_JP

                    ! Начальное значение суммы для срабатывания цикла
                    s = 2._RP

                    ! Инициализация начальных значений r1 и r2
                    r1 = 1._RP; r2 = 1._RP

                    do while( (s .gt. 1._RP) .or. (s .lt. 1e-8_RP) )

                         ! Получение значений случайных величин на полуинтервале [0, 1)
                         rr1 = scats_generate_random_uniform()
                         rr2 = scats_generate_random_uniform()

                         ! Проверка на их малость
                         if (abs(rr1) .lt. 1e-8_RP) rr1 = 0._RP
                         if (abs(rr2) .lt. 1e-8_RP) rr2 = 0._RP

                         ! Получение значений случайных величин на отрезке [-1, 1)
                         r1 = 2._RP * rr1 - 1._RP
                         r2 = 2._RP * rr2 - 1._RP

                         ! Вычисление суммы квадратов
                         s = r1 * r1 + r2 * r2

                    enddo

                    ! Вычисление фактора
                    fac = sqrt(-2._RP * log(s) / s)

                    ! Вычисление случайных величин
                    array(i1) = r1 * fac
                    array(i2) = r2 * fac

               enddo

               ! Начальное значение суммы для срабатывания цикла
               s = 2._RP

               ! Инициализация начальных значений r1 и r2
               r1 = 1._RP; r2 = 1._RP

               do while( (s .gt. 1._RP) .or. (s .lt. 1e-8_RP) )

                    ! Получение значений случайных величин на полуинтервале [0, 1)
                    rr1 = scats_generate_random_uniform()
                    rr2 = scats_generate_random_uniform()

                    ! Проверка на их малость
                    if (abs(rr1) .lt. 1e-8_RP) rr1 = 0._RP
                    if (abs(rr2) .lt. 1e-8_RP) rr2 = 0._RP

                    ! Получение значений случайных величин на отрезке [-1, 1)
                    r1 = 2._RP * rr1 - 1._RP
                    r2 = 2._RP * rr2 - 1._RP

                    ! Вычисление суммы квадратов
                    s = r1 * r1 + r2 * r2

               enddo

               ! Вычисление фактора
               fac = sqrt(-2._RP * log(s) / s)

               ! Вычисление случайных величин
               array(length - 1_JP) = r1 * fac

          endif
          
     end procedure scats_generate_random_array
     
end submodule scats_generate_random_array_s