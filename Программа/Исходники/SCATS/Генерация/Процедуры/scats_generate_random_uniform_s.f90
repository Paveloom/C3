submodule ( scats_gen_m ) scats_generate_random_uniform_s
implicit none
     
     contains
     
     ! Функция для получения значения равномерно распределенного случайного числа 
     module procedure scats_generate_random_uniform
          
        call random_number(scats_generate_random_uniform)
          
     end procedure scats_generate_random_uniform
     
end submodule scats_generate_random_uniform_s