module scats_visualize_m ! Модуль, содержащий описания процедур для
                         ! визуализации входных данных и результатов
implicit none
     
     private
     public :: visualize_type ! Тип, содержащий процедуры для визуализации

     ! Тип, содержащий процедуры для визуализации
     type visualize_type
          
          contains

          procedure :: input => scats_visualize_input
          
     end type visualize_type
     
     interface
     
          ! Процедура для визуализации входных данных
          module subroutine scats_visualize_input(visualize, file)
          implicit none
          
               class( visualize_type ) :: visualize ! Экземпляр API для визуализации
               character(*), intent(in) :: file ! Имя файла с входными данными
          
          end subroutine scats_visualize_input
     
     end interface
     
end module scats_visualize_m