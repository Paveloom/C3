
     ## Это шаблон* make-файла для компиляции программ.

     ## * Изменен для данного проекта.

     ## Репозиторий на GitHub: https://github.com/Paveloom/B1
     ## Документация: https://www.notion.so/paveloom/B1-fefcaf42ddf541d4b11cfcab63c2f018

     ## Версия релиза: 2.1.3
     ## Версия документации: 2.1.0

     ## Автор: Павел Соболев (http://paveloom.tk)

     ## Для корректного отображения содержимого
     ## символ табуляции должен визуально иметь
     ## ту же длину, что и пять пробелов.

     # Настройки make-файла

     ## Имя координатора
     make_name := make

     ## Указание оболочки
     SHELL := /bin/bash

     ## Указание make-файлу выполнять все правила в одном вызове оболочки
     .ONESHELL :

     ## Заглушка на вывод сообщений указанными правилами
     ## (без указания имён подавляет вывод со стороны make-файла у всех правил)
     .SILENT :

     ## Правила-псевдоцели

     .PHONY : result, result-r, result-d, result-c, clean

     ## Правило, выполняющееся при вызове координатора без аргументов
     ALL : result

     # Настройки компиляции программ

     ## Компилятор
     comp := gfortran

     ## Флаг для указания директории для хранения .mod файлов
     module_flag := -J

     ## Расширение исходных файлов
     pattern := f90

     ## Режим отладки (при значении true использует флаги opt_debug, при другом значении — opt_production)
     debugging := false

     ## Флаги для отладки
     opt_debug := -Og -g -Wall -Wextra -Warray-temporaries -Wcharacter-truncation -Wconversion-extra \
                  -Wimplicit-interface -Wimplicit-procedure -Wintrinsics-std \
                  -Wreal-q-constant -Wsurprising -Wunderflow -Walign-commons \
                  -Wfunction-elimination -Wrealloc-lhs -Wrealloc-lhs-all \
                  -fbacktrace -ffree-line-length-0 -fcheck=all \
                  -ffpe-trap=invalid,zero,overflow,underflow -pedantic-errors -std=f2018

     ## Флаги для финальной сборки
     opt_production := -Ofast -ffree-line-length-0

     ## Имя главной программы
     main_name := main

     ## Использовать input файл?
     use_input := false

     ## Использовать output файл?
     use_output := false

     ## Сохранять собранную программу при очистке?
     save_main := false

     ## Директория с исходными файлами (всегда в окончании прямой слеш; точка-слеш, если хранить в текущей директории)
     source_path := Исходники/

     ## Указание поддиректорий в директории с исходными файлами (всегда в окончании прямой слеш), относящихся к модулю
     module_subs := Визуализация/ Визуализация/Вход/ Визуализация/Результат/ \
                    Вспомогательные/Освобождение/ Вспомогательные/Генерация/ Вспомогательные/Действия/Тренд/ \
                    Вспомогательные/Действия/Периодограммы/ Вспомогательные/Действия/Коррелограммы/ \
                    Вход/ Вход/Освобождение/ Вход/Ошибки/ Вход/Запись/ Вход/Считывание/ \
                    Генерация/ Генерация/Процедуры/ Генерация/Ошибки/ \
                    Генерация/Параметры/ Генерация/Параметры/Ошибки/ Генерация/Параметры/Считывание/ \
                    Генерация/Параметры/Освобождение/ \
                    Генерация/Настройки/ Генерация/Настройки/Ошибки/ Генерация/Настройки/Считывание/ \
                    Результат/ Результат/Освобождение/ Результат/Ошибки/ Результат/Запись/ \
                    Действия/ Действия/Ошибки/ Действия/Ошибки/Процедура/ Действия/Проверка/ Действия/Проверка/Процедура/ \
                    Действия/Тренд/ Действия/Тренд/Линейный/ \
                    Действия/Периодограммы/ Действия/Периодограммы/Обычная/ Действия/Периодограммы/Сглаженная/ \
                    Действия/FFT/ Действия/FFT/Процедуры/ \
                    Действия/Коррелограммы/ Действия/Коррелограммы/Обычная/ Действия/Коррелограммы/Взвешенная/

     ## Указание всех поддиректорий в директории с исходными файлами (всегда в окончании прямой слеш)
     subs := SCATS/ $(addprefix SCATS/, $(module_subs))

     ## Директория с объектными файлами (всегда в окончании прямой слеш; точка-слеш, если хранить в текущей директории)
     obj_path := Объектники/

     ## Правила-зависимости (при необходимости)

     $(obj_path)$(main_name).o : $(obj_path)scats.o

          # API модуля
          $(obj_path)scats.o : $(obj_path)scats_gen_m.o $(obj_path)scats_input_m.o \
                               $(obj_path)scats_visualize_m.o $(obj_path)scats_result_m.o \
                               $(obj_path)scats_do_m.o $(obj_path)prec_m.o

               # Вспомогательная процедура для вызова генератора временного ряда
               $(obj_path)scats_generate_s.o : $(obj_path)scats.o

               # Процедура для общего освобождения памяти
               $(obj_path)scats_deallocate_s.o : $(obj_path)scats.o

               # Вспомогательная процедура для извлечения тренда из входных данных
               $(obj_path)scats_remove_trend_s.o : $(obj_path)scats.o

               # Вспомогательная процедура для вычисления периодограммы
               $(obj_path)scats_calculate_periodogram_s.o : $(obj_path)scats.o

               # Вспомогательная процедура для вычисления коррелограммы
               $(obj_path)scats_calculate_correlogram_s.o : $(obj_path)scats.o

               # Вспомогательная процедура для вычисления взвешенной коррелограммы
               $(obj_path)scats_calculate_weighted_correlogram_s.o : $(obj_path)scats.o

               # Вспомогательная процедура для вычисления сглаженной периодограммы
               $(obj_path)scats_calculate_weighted_periodogram_s.o : $(obj_path)scats.o

               # Визуализация
               $(obj_path)scats_visualize_input_s.o : $(obj_path)scats_visualize_m.o
               $(obj_path)scats_visualize_result_s.o : $(obj_path)scats_visualize_m.o

               # Генератор
               $(obj_path)scats_gen_m.o : $(obj_path)prec_m.o $(obj_path)scats_gen_params_m.o $(obj_path)scats_input_m.o

                    # Процедура для вывода ошибок (генерация временного ряда)
                    $(obj_path)scats_gen_log_error_s.o : $(obj_path)scats_gen_params_m.o

                    # Процедура для генерации временного ряда
                    $(obj_path)scats_gen_generate_s.o : $(obj_path)scats_gen_m.o

                    # Процедура для генерации массива значений нормально распределенных случайных величин
                    $(obj_path)scats_gen_generate_random_array_s.o : $(obj_path)scats_gen_m.o

                    # Параметры генератора
                    $(obj_path)scats_gen_params_m.o : $(obj_path)prec_m.o $(obj_path)scats_gen_settings_m.o

                         # Процедура для вывода ошибок (параметры генерации временного ряда)
                         $(obj_path)scats_gen_params_log_error_s.o : $(obj_path)scats_gen_params_m.o

                         # Процедура для считывания параметров для генерации временного ряда
                         $(obj_path)scats_gen_params_read_s.o : $(obj_path)scats_gen_params_m.o

                         # Процедура для освобождения памяти из-под параметров
                         $(obj_path)scats_gen_params_deallocate_s.o : $(obj_path)scats_gen_params_m.o

                    # Настройки считывания параметров генератора
                    $(obj_path)scats_gen_settings_m.o : $(obj_path)prec_m.o

                         # Процедура для вывода ошибок (настройки считывания параметров)
                         $(obj_path)scats_gen_settings_log_error_s.o : $(obj_path)scats_gen_settings_m.o

                         # Процедура для считывания настроек считывания параметров для генерации временного ряда
                         $(obj_path)scats_gen_settings_read_s.o : $(obj_path)scats_gen_settings_m.o

               # Входные данные
               $(obj_path)scats_input_m.o : $(obj_path)prec_m.o

                    # Процедура для вывода ошибок (входные данные)
                    $(obj_path)scats_input_log_error_s.o : $(obj_path)scats_input_m.o

                    # Процедура для считывания входных данных
                    $(obj_path)scats_input_read_s.o : $(obj_path)scats_input_m.o

                    # Процедура для записи входных данных в файл
                    $(obj_path)scats_input_write_to_file_s.o : $(obj_path)scats_input_m.o

                    # Процедура освобождения памяти из-под входных данных
                    $(obj_path)scats_input_deallocate_s.o : $(obj_path)scats_input_m.o

               # Результат
               $(obj_path)scats_result_m.o : $(obj_path)prec_m.o

                    # Процедура для вывода ошибок (результат)
                    $(obj_path)scats_result_log_error_s.o : $(obj_path)scats_result_m.o

                    # Процедура для записи результата в файл
                    $(obj_path)scats_result_write_to_file_s.o : $(obj_path)scats_result_m.o

                    # Процедура для освобождения памяти из-под результата
                    $(obj_path)scats_result_deallocate_s.o : $(obj_path)scats_result_m.o

               # Операции над данными
               $(obj_path)scats_do_m.o : $(obj_path)scats_input_m.o $(obj_path)scats_result_m.o \
                                         $(obj_path)scats_do_trend_m.o $(obj_path)scats_do_periodogram_m.o \
                                         $(obj_path)scats_do_correlogram_m.o

                    # Процедура для вывода ошибок (действия)
                    $(obj_path)scats_do_errors_log_error_s.o : $(obj_path)scats_do_errors_m.o

                    # Проверка на совпадение форм входных данных и результата
                    $(obj_path)scats_do_check_m.o : $(obj_path)scats_input_m.o $(obj_path)scats_result_m.o \
                                                    $(obj_path)scats_do_errors_m.o

                         # Процедура для проверки на совпадение форм входных данных и результата
                         $(obj_path)scats_do_check_s.o : $(obj_path)scats_do_check_m.o

                    # Извлечение тренда
                    $(obj_path)scats_do_trend_m.o : $(obj_path)prec_m.o $(obj_path)scats_input_m.o $(obj_path)scats_result_m.o \
                                                    $(obj_path)scats_do_errors_m.o $(obj_path)scats_do_check_m.o

                         # Процедура для удаления линейного тренда из входных данных
                         $(obj_path)scats_do_trend_remove_linear_trend_s.o : $(obj_path)scats_do_trend_m.o

                    # Быстрое преобразование Фурье
                    $(obj_path)scats_do_fft_m.o : $(obj_path)prec_m.o

                         # Процедура для выполнения быстрого преобразования Фурье
                         $(obj_path)scats_do_fft_calculate_s.o : $(obj_path)scats_do_fft_m.o

                         # Функция для выполнения поразрядно обратной перестановки
                         $(obj_path)scats_do_fft_rev_s.o : $(obj_path)scats_do_fft_m.o

                    # Вычисление периодограммы
                    $(obj_path)scats_do_periodogram_m.o : $(obj_path)prec_m.o $(obj_path)scats_result_m.o $(obj_path)scats_input_m.o \
                                                          $(obj_path)scats_do_check_m.o $(obj_path)scats_do_errors_m.o $(obj_path)scats_do_fft_m.o

                         # Процедура для вычисления периодограммы
                         $(obj_path)scats_do_periodogram_calculate_s.o : $(obj_path)scats_do_periodogram_m.o

                         # Процедура для вычисления сглаженной периодограммы
                         $(obj_path)scats_do_periodogram_calculate_w_s.o : $(obj_path)scats_do_periodogram_m.o

                    # Вычисление коррелограммы
                    $(obj_path)scats_do_correlogram_m.o : $(obj_path)prec_m.o $(obj_path)scats_result_m.o $(obj_path)scats_input_m.o \
                                                          $(obj_path)scats_do_check_m.o $(obj_path)scats_do_errors_m.o $(obj_path)scats_do_fft_m.o

                         # Процедура для вычисления коррелограммы
                         $(obj_path)scats_do_correlogram_calculate_s.o : $(obj_path)scats_do_correlogram_m.o

                         # Процедура для вычисления взвешенной коррелограммы
                         $(obj_path)scats_do_correlogram_calculate_w_s.o : $(obj_path)scats_do_correlogram_m.o

     # Определение флагов компилятора

     ifeq (true, $(debugging))
          opt := $(opt_debug)
     else
          opt := $(opt_production)
     endif

     # Распределение исходных файлов по переменным

     ## Директории, где искать исходные файлы
     VPATH := $(source_path) $(addprefix $(source_path), $(subs))

     ## Получение полного списка исходных файлов

     allpattern := $(addsuffix *.$(pattern), $(VPATH))
     source := $(wildcard $(allpattern))

     main_source := $(filter %$(main_name).$(pattern), $(source))

     ## Смена пути исходных файлов

     obj_path_source := $(addprefix $(obj_path), $(notdir $(source)))

     ## Получение списков .mod файлов и .o файлов, связанных с модулями. Объектный
     ## файл для главной программы записан в переменную obj_main для сохранения
     ## общности семантики.

     mod := $(filter-out %$(main_name).mod, $(patsubst %.$(pattern), %.mod, $(obj_path_source)))
     obj_mod := $(patsubst %.mod, %.o, $(mod))

     obj_main := $(patsubst %.$(pattern), %.o, $(filter %$(main_name).$(pattern), $(obj_path_source)))

     # Блок правил для компиляции объектных файлов

     $(main_name) : $(obj_main) $(obj_mod)
	               $(comp) $(opt) $^ -o $@

     $(obj_path)%.o : %.$(pattern)
	                 $(comp) -c $(opt) $(module_flag) $(obj_path) $< -o $(addprefix $(obj_path), $(subst .$(pattern),.o, $(notdir $<)))

     $(obj_main) : $(main_source)
	              $(comp) -c $(opt) $(module_flag) $(obj_path) $< -o $(addprefix $(obj_path), $(notdir $@))

     # Блок правил для сборки программы

     input :
	        touch input

     result : $(main_name)
	         if [ "true" = "$(use_input)" ]; then
	              $(make_name) input;
	              if [ "true" = "$(use_output)" ]; then
	                   time ./$< < input > output;
	              else
	                   time ./$< < input;
	              fi
	         else
	              if [ "true" = "$(use_output)" ]; then
	                   time ./$< > output;
	              else
	                   time ./$<;
	              fi
	         fi

     result-r :
	           if [ "true" != "$(use_output)" ]; then
	                echo; echo "Вы не можете использовать это правило, пока значение переменной use_output != true."; echo;
	                exit 1;
	           fi
	           $(make_name) result
	           cat output

     result-d :
	           $(make_name) result
	           $(make_name) clean

     result-c :
	           if [ "true" != "$(use_output)" ]; then
	                echo; echo "Вы не можете использовать это правило, пока значение переменной use_output != true."; echo;
	                exit 1;
	           fi
	           $(make_name) result-r
	           $(make_name) clean

     # Правило для очистки

     clean :
	        if [ "true" = "$(save_main)" ]; then
	             rm -f $(obj_main) $(obj_mod) $(obj_path)*.smod $(mod);
	        else
	             rm -f $(obj_main) $(obj_mod) $(obj_path)*.smod $(mod) $(main_name);
	        fi
