submodule ( scats_do_periodogram_m ) scats_do_periodogram_rev_s
implicit none
     
     contains
     
     ! Функция для выполнения поразрядно обратной перестановки
     module procedure scats_do_periodogram_rev

          ! Источник алгоритма: https://e-maxx.ru/algo/fft_multiply
          
          integer(JP) :: i ! Счетчик

          res = 0_JP

          i = 0_JP
          do while ( i .lt. lg_n )

               if ( transfer(iand(num, shiftl(1_JP, i)), .true.) ) then

                    res = ior(res, shiftl(1_JP, lg_n - 1_JP - i))

               endif

               i = i + 1_JP

          enddo
          
     end procedure scats_do_periodogram_rev
     
end submodule scats_do_periodogram_rev_s