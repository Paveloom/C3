submodule ( scats_do_periodogram_m ) scats_do_periodogram_fft_s
implicit none

     contains
     
     ! Процедура для выполнения быстрого преобразования Фурье
     module procedure scats_do_periodogram_fft

          ! Источник алгоритма: https://e-maxx.ru/algo/fft_multiply

          complex(RP) :: n_C ! Размер выборки в виде комплексного числа

          real(RP) :: arg ! Аргумент
          real(RP) :: pi  ! Число pi

          complex(RP) :: tmp  ! Временная переменная
          complex(RP) :: w   ! Первообразный корень
          complex(RP) :: u, v ! Элементы из массива 
          integer(JP) :: rev  ! Результат перестановки

          integer(JP) :: i, j, k ! Счетчики
          integer(JP) :: ih ! Половина от i
          real(RP) :: i_RP ! Овеществление i

          ! Заполнение n_C
          n_C%re = n_d
          n_C%im = 0._RP

          ! Вычисление числа pi
          pi = 4._RP * atan(1._RP)
          
          i = 0_JP

          ! Поразрядная обратная перестановка
          do while ( i .lt. n ) 

               rev = scats_do_periodogram_rev(i, lg_n)

               if ( i .lt. rev ) then

                    tmp = a(rev)
                    a(rev) = a(i)
                    a(i) = tmp

               endif

               i = i + 1_JP

          enddo

          i = 2_JP

          ! Выполнение преобразования Фурье
          do while (i .le. n)

               i_RP = real(i, kind=RP)
               ih = i / 2_JP

               arg = 2._RP * pi / i_RP

               tmp%re = cos(arg)
               tmp%im = sin(arg)

               j = 0_JP
               do while (j .lt. n)

                    w%re = 1._RP
                    w%im = 0._RP

                         k = 0_JP
                         do while (k .lt. ih)

                              u = a(j + k)
                              v = a(j + k + ih) * w
                              a(j + k) = u + v
                              a(j + k + ih) = u - v
                              w = w * tmp

                              k = k + 1_JP

                         enddo

                    j = j + i

               enddo

               i = ishft(i, 1_JP)

          enddo

     end procedure scats_do_periodogram_fft
     
end submodule scats_do_periodogram_fft_s