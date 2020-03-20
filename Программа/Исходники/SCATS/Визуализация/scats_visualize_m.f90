module scats_visualize_m ! Модуль, содержащий описания процедур для
                         ! визуализации входных данных и результатов
implicit none
     
     private
     public :: visualize_type ! Тип, содержащий процедуры для визуализации

     ! Тип, содержащий процедуры для визуализации
     type visualize_type
          
          contains

          ! Процедура для визуализации входных данных
          procedure :: input => scats_visualize_input

          ! Процедура для визуализации результата
          procedure :: result => scats_visualize_result
          
     end type visualize_type
     
     interface
     
          ! Процедура для визуализации входных данных
          module subroutine scats_visualize_input(visualize, input_file, output_file, title)
          implicit none
          
               class( visualize_type ) :: visualize ! Экземпляр API для визуализации
               character(*), intent(in) :: input_file ! Имя файла с входными данными
               character(*), intent(in), optional :: output_file ! Имя выходной фигуры
               character(*), intent(in), optional :: title ! Индивидуальный заголовок
          
          end subroutine scats_visualize_input

          ! Процедура для визуализации результата
          module subroutine scats_visualize_result(visualize, input_file, output_file, title)
          implicit none
          
               class( visualize_type ) :: visualize ! Экземпляр API для визуализации
               character(*), intent(in) :: input_file ! Имя файла с данными
               character(*), intent(in), optional :: output_file ! Имя выходной фигуры
               character(*), intent(in), optional :: title ! Индивидуальный заголовок
          
          end subroutine scats_visualize_result
     
     end interface
     
end module scats_visualize_m