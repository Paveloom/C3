[![](https://img.shields.io/badge/GitHub-Paveloom/C3-5DA399.svg)](https://github.com/Paveloom/) [![](https://img.shields.io/badge/license-Unlicense-5DA399.svg)](https://github.com/Paveloom/C3/blob/master/LICENSE.md) <br>
[![](https://img.shields.io/badge/release-v1.2.0-informational.svg)](https://github.com/Paveloom/C3/releases/tag/v1.2.0) [![](https://img.shields.io/badge/platforms-linux,%20macOS-3E6680.svg)](#) [![](https://img.shields.io/badge/requires-gcc%209.1%2B-critical.svg)](https://gcc.gnu.org/wiki/GFortran/News#GCC9) [![](https://img.shields.io/badge/requires-python%203.7%2B-critical.svg)](https://www.python.org/downloads/)

# Описание

Возможности API модуля:
+ генерация равномерного временного ряда с произвольным набором гармонических компонент;
+ исключение линейного тренда из данных временного ряда;
+ вычисление периодограммы с использованием быстрого преобразования Фурье;
+ вычисление коррелограммы с использованием быстрого преобразования Фурье;
+ вычисление взвешенной коррелограммы с использованием весовой функции Тьюки;
+ вычисление сглаженной периодограммы с использованием быстрого преобразования Фурье;
+ графическое представление получаемых результатов.

Полный список доступных к вызову процедур изображен на [mind-карте интерфейса](https://github.com/Paveloom/C3/blob/master/Mind-карты/SCATS%20API/SCATS%20API.svg).

[Другие варианты make-файлов](https://github.com/Paveloom/C3/tree/master/Make-файлы), [mind-карты](https://github.com/Paveloom/C3/tree/master/Mind-карты) используемых типов, а также [архивы](https://github.com/Paveloom/C3/tree/master/Архивы) с программой, пакетами make-файлов и mind-карт расположены в одноименных директориях. Книга, на основе которой были описаны процедуры этого модуля, доступна к скачиванию / просмотру [здесь](https://github.com/Paveloom/C3/blob/master/Материалы/В.%20В.%20Витязев%20—%20Спектрально-корреляционный%20анализ%20равномерных%20временных%20рядов.pdf).

# Использование

Демонстрационная программа расположена в одноименной [директории](https://github.com/Paveloom/C3/tree/master/Программа). Модуль для выполнения спектрально-корреляционного анализа равномерных временных рядов — в поддиректории [Исходники/SCATS](https://github.com/Paveloom/C3/tree/master/Программа/Исходники/SCATS).

Минимальные требования к сборке и запуску:
+ компилятор [gfortran](https://gcc.gnu.org/wiki/GFortran) из набора компиляторов [GCC 9+](https://gcc.gnu.org/wiki/GFortran/News#GCC9) (поддержка подмодулей; поддержка доступа к вещественным и мнимым частям комплексного числа с помощью _c%re_ и _c%im_);
+ [Python 3.7+](https://www.python.org/downloads/) (ветка, которая была использована при разработке этого модуля);
+ Наличие установленных пакетов Python: _matplotlib_;
+ Наличие установленных системных пакетов: _texlive-fonts-extra_, _texlive-lang-cyrillic_, _cm-super_.

Сборка и запуск из папки с программой производятся с помощью команды _``make``_. Удаление исполняемого файла и объектных файлов из папки [Объектники](https://github.com/Paveloom/C3/tree/master/Программа/Объектники) выполняется с помощью команды _``make clean``_.

Сниппет зависимостей расположен в текущем [make-файле](https://github.com/Paveloom/C3/blob/master/Программа/Makefile?ts=5).

Автор: [Павел Соболев](http://paveloom.tk).