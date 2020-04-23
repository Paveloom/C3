module SCATS ! Модуль, содержащий API алгоритма СКАВР [v1.3.0]
use prec_m, only : RP ! Точность вещественных чисел, используемых в программе
use scats_gen_m, only : gen_type ! Тип, содержащий типы параметров, их настроек и
                                 ! включающий в себя процедуру генерации данных
use scats_input_m, only : input_type ! Тип, определяющий входные данные
use scats_visualize_m, only : visualize_type ! Тип, содержащий процедуры для визуализации
use scats_result_m, only : result_type ! Тип, определяющий результат
use scats_do_m, only : scats_do_trend_remove_linear_trend, & ! Процедура для удаления линейного тренда из входных данных
                     & scats_do_periodogram_calculate, & ! Процедура для вычисления периодограммы
                     & scats_do_periodogram_calculate_w, & ! Процедура для вычисления сглаженной периодограммы
                     & scats_do_correlogram_calculate, & ! Процедура для вычисления коррелограммы
                     & scats_do_correlogram_calculate_w ! Процедура для вычисления взвешенной коррелограммы
implicit none

     private
     public :: SCATS_API, & ! API модуля
             & RP ! Точность вещественных чисел, используемых в программе

     type SCATS_API

          type( input_type ) :: input ! Экземпляр API для взаимодействия с входными данными
          type( gen_type ) :: gen ! Экземпляр API для генерации временного ряда
          type( visualize_type ) :: visualize ! Экземпляр API для визуализации
          type( result_type ) :: result ! Экземпляр API для взаимодействия с результатом

          contains

          ! Вспомогательная процедура для считывания параметров генератора
          procedure :: read_params => scats_read_params

          ! Вспомогательная процедура для считывания настроек считывания параметров
          procedure :: read_gen_settings => scats_read_gen_settings

          ! Вспомогательная процедура для считывания входных данных
          procedure :: read_input => scats_read_input

          ! Вспомогательная процедура для записи входных данных в файл
          procedure :: write_input => scats_write_input

          ! Вспомогательная процедура для вызова генератора временного ряда
          procedure :: generate => scats_generate

          ! Процедура для общего освобождения памяти
          procedure :: deallocate => scats_deallocate

          ! Вспомогательная процедура для извлечения тренда из входных данных
          procedure :: rem_trend => scats_remove_trend

          ! Вспомогательная процедура для вычисления периодограммы
          procedure :: calc_per => scats_calculate_periodogram

          ! Вспомогательная процедура для вычисления коррелограммы
          procedure :: calc_corr => scats_calculate_correlogram

          ! Вспомогательная процедура для вычисления взвешенной коррелограммы
          procedure :: calc_w_corr => scats_calculate_weighted_correlogram

          ! Вспомогательная процедура для вычисления сглаженной коррелограммы
          procedure :: calc_w_per => scats_calculate_weighted_periodogram

          ! Вспомогательная процедура для записи результата в файл
          procedure :: write_result => scats_write_result

     end type SCATS_API

     interface

          ! Вспомогательная процедура для считывания параметров генератора
          module impure subroutine scats_read_params(s, file)
          implicit none

               class( SCATS_API ), intent(inout) :: s ! Экземпляр API модуля
               character(*), intent(in) :: file ! Имя файла для считывания

          end subroutine scats_read_params

          ! Вспомогательная процедура для считывания настроек считывания параметров
          module impure subroutine scats_read_gen_settings(s, file)
          implicit none

               class( SCATS_API ), intent(inout) :: s ! Экземпляр API модуля
               character(*), intent(in) :: file ! Имя файла для считывания

          end subroutine scats_read_gen_settings

          ! Вспомогательная процедура для считывания входных данных
          module impure subroutine scats_read_input(s, file)
          implicit none

               class( SCATS_API ), intent(inout) :: s ! Экземпляр API модуля
               character(*), intent(in) :: file ! Имя файла для считывания

          end subroutine scats_read_input

          ! Вспомогательная процедура для записи входных данных в файл
          module impure subroutine scats_write_input(s, file)
          implicit none

               class( SCATS_API ), intent(inout) :: s ! Экземпляр API модуля
               character(*), intent(in) :: file ! Имя файла для считывания

          end subroutine scats_write_input

          ! Вспомогательная процедура для вызова генератора временного ряда
          module impure subroutine scats_generate(s, add_trend, add_noise)
          implicit none

               class( SCATS_API ), intent(inout) :: s ! Экземпляр API модуля

               logical(kind(.true.)), optional, intent(in) :: add_trend ! Добавлять тренд?
               logical(kind(.true.)), optional, intent(in) :: add_noise ! Добавлять шум?

          end subroutine scats_generate

          ! Процедура для общего освобождения памяти
          module impure subroutine scats_deallocate(s)
          implicit none

               class( SCATS_API ), intent(inout) :: s ! Экземпляр API модуля

          end subroutine scats_deallocate

          ! Вспомогательная процедура для извлечения тренда из входных данных
          module impure subroutine scats_remove_trend(s, type)
          implicit none

               class( SCATS_API ), intent(inout) :: s ! Экземпляр API модуля

               ! Тип тренда
               character(*), intent(in) :: type

          end subroutine scats_remove_trend

          ! Вспомогательная процедура для вычисления периодограммы
          module impure subroutine scats_calculate_periodogram(s, use_input)
          implicit none

               class( SCATS_API ), intent(inout) :: s ! Экземпляр API модуля
               logical(kind(.true.)), optional, intent(in) :: use_input ! Использовать входные данные
                                                                        ! вместо данных из результата?

          end subroutine scats_calculate_periodogram

          ! Вспомогательная процедура для вычисления коррелограммы
          module impure subroutine scats_calculate_correlogram(s, use_input)
          implicit none

               class( SCATS_API ), intent(inout) :: s ! Экземпляр API модуля
               logical(kind(.true.)), optional, intent(in) :: use_input ! Использовать входные данные
                                                                        ! вместо данных из результата?

          end subroutine scats_calculate_correlogram

          ! Вспомогательная процедура для вычисления взвешенной коррелограммы
          module impure subroutine scats_calculate_weighted_correlogram(s, nfactor, a)
          implicit none

               class( SCATS_API ), intent(inout) :: s ! Экземпляр API модуля
               real(RP), intent(in) :: nfactor ! Множитель перед N (.ge. 0.1 .and. le. 1.0)
               real(RP), intent(in) :: a ! Множитель a весовой функции

          end subroutine scats_calculate_weighted_correlogram

          ! Вспомогательная процедура для вычисления сглаженной периодограммы
          module impure subroutine scats_calculate_weighted_periodogram(s)
          implicit none

               class( SCATS_API ), intent(inout) :: s ! Экземпляр API модуля

          end subroutine scats_calculate_weighted_periodogram

          ! Вспомогательная процедура для записи результата в файл
          module impure subroutine scats_write_result(s, file)
          implicit none

               class( SCATS_API ), intent(inout) :: s ! Экземпляр API модуля
               character(*), intent(in) :: file ! Имя файла для считывания

          end subroutine scats_write_result

     end interface

end module SCATS