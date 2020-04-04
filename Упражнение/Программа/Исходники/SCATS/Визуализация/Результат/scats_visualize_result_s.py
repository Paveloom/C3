# coding=utf-8

# Скрипт для визуализации входных данных

# Подключение модулей

## Подключение модуля для получения базовых имен
## файлов и содержимого переменных окружения
from os import environ
from os.path import basename

### Проверка на запуск в виртуальной среде системы macOS
if environ.get('RUNNING_IN_MACOS_VM'):
    quit()

## Подключение модуля numpy
import numpy as np

## Подключение пакетов для настройки и создания графики
from matplotlib import rcParams as rcP
from matplotlib import pyplot as plt

## Подключение модуля для расширения возможностей итераций
from itertools import islice

## Подключение модуля для контроля над аргументами скрипта
from sys import argv

## Подключение модуля для поиска регулярных выражений
import re

# Сохранение переданных аргументов
input_name = str(argv[1])
stage = str(argv[2])
output_name = str(argv[3])
title = str(argv[4])
xlim = str(argv[5])
ylim = str(argv[6])
show_sigma = str(argv[7])

# Настройки по умолчанию для выходной фигуры
if output_name == '-0-':
    custom_path = False
    if stage == 'data':
        output_name = 'data'

    if stage == 'per':
        output_name = 'periodogram'

    if stage == 'corr':
        output_name = 'correlogram'

    if stage == 'w_per':
        output_name = 'weighted_periodogram'

else:
    custom_path = True

# Настройки по умолчанию для названий осей
if stage == 'data':
    xlabel = 'Время'
    ylabel = 'Значение'

elif stage == 'per':
    xlabel = 'Частота'
    ylabel = 'Значение'

elif stage == 'corr':
    xlabel = 'Время'
    ylabel = 'Значение'

elif stage == 'w_per':
    xlabel = 'Частота'
    ylabel = 'Значение'

# Настройки по умолчанию для заголовка
if title == '-0-':
    if stage == 'data':
        title = 'Исходный временной ряд'

    elif stage == 'per':
        title = 'Периодограмма'

    elif stage == 'corr':
        title = 'Коррелограмма'

    elif stage == 'w_per':
        title = 'Сглаженная периодограмма'

# Распаковка пределов для оси абсцисс
if xlim == '-0-':
    use_xlim = False
else:
    xlim_sa = re.search('\(.+,', xlim).group(0)
    xlim_sb = re.search(',.+\)', xlim).group(0)
    xlim_a = np.float(re.split(',', re.split('\(', xlim_sa)[1])[0])
    xlim_b = np.float(re.split(',', re.split('\)', xlim_sb)[0])[1])
    use_xlim = True

# Распаковка пределов для оси ординат
if ylim == '-0-':
    use_ylim = False
else:
    ylim_sa = re.search('\(.+,', ylim).group(0)
    ylim_sb = re.search(',.+\)', ylim).group(0)
    ylim_a = np.float(re.split(',', re.split('\(', ylim_sa)[1])[0])
    ylim_b = np.float(re.split(',', re.split('\)', ylim_sb)[0])[1])
    use_ylim = True

# Настройки графиков

## Настройка DPI
rcP["savefig.dpi"] = 300
rcP["figure.dpi"] = 300

## Включение поддержки TeX
rcP["text.usetex"] = True

## Включение поддержки русского языка
rcP["text.latex.preamble"] = [r'\usepackage[main=russian,english]{babel}',
                              r'\usepackage{cmlgc}']

## Установка семейства шрифтов для текста внутри математической моды
rcP['mathtext.fontset'] = 'cm'

## Установка размеров шрифта
rcP["font.size"] = 18
rcP["legend.fontsize"] = 12

# Считывание данных из файла

## Создание пустого списка
lines = []

if stage == 'data':

    ## Считывание строк с данными
    with open(input_name) as f:
        for line in islice(f, 7, 11, 3):
            lines.append(line)

    ## Получение значений массива времени
    x = np.array(lines[0].split(), dtype = np.float)

    ## Получение значений массива значений
    y = np.array(lines[1].split(), dtype = np.float)

elif stage == 'per':

    ## Считывание строк с данными
    with open(input_name) as f:
        for line in islice(f, 13, 23, 3):
            lines.append(line)

    ## Получение значения уровня значимости
    q = np.float(lines[0])

    ## Получение порога обнаружения сигнала
    threshold = np.float(lines[1])

    ## Получение значений массива частот периодограммы
    x = np.array(lines[2].split(), dtype = np.float)

    ## Получение значений массива значений периодограммы
    y = np.array(lines[3].split(), dtype = np.float)

elif stage == 'corr':

    ## Считывание строк с данными
    with open(input_name) as f:
        for line in islice(f, 7, 26, 18):
            lines.append(line)

    ## Получение значений массива времени
    x = np.array(lines[0].split(), dtype = np.float)

    ## Получение значений массива значений коррелограммы
    y = np.array(lines[1].split(), dtype = np.float)

elif stage == 'w_per':

    ## Считывание строк с данными
    with open(input_name) as f:
        for line in islice(f, 19, 29, 9):
            lines.append(line)

    ## Получение значений массива частот периодограммы
    x = np.array(lines[0].split(), dtype = np.float)

    ## Получение значений массива значений сглаженной периодограммы
    y = np.array(lines[1].split(), dtype = np.float)

# Создание и сохранение фигуры

## Создание фигуры
f = plt.figure()

## Создание графика
plt.plot(x, y, color="#425378")

## Добавление порога обнаружения сигнала
if stage == 'per' and show_sigma == 'True':
    plt.axhline(y=threshold, color="#635D9E", alpha=0.5, linestyle="--")
    plt.text(x[-1] * 0.915, threshold * 1.075, r'\textrm{' + str((1 - q) * 100) + '\%}', fontsize=12)

## Добавление вертикальной линии на частоте,
## равной половине частоты Найквиста
if stage == 'per':
    plt.axvline(x=0.25, color="#7C40A0", linestyle='--')

## Добавление заголовка
plt.title(r'\textrm{' + title + '}')

## Изменение пределов на оси абсцисс
if use_xlim:
    plt.xlim(xlim_a, xlim_b)

## Изменение пределов на оси ординат
if use_ylim:
    plt.ylim(ylim_a, ylim_b)

## Добавление названий осей
plt.xlabel(r'\textrm{' + xlabel + '}')
plt.ylabel(r'\textrm{' + ylabel + '}')

## Сохранение фигуры
if custom_path:
    f.savefig(output_name + ".pdf", bbox_inches='tight')
else:
    f.savefig("Фигуры/" + output_name + ".pdf", bbox_inches='tight')