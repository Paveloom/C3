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

# Сохранение переданных аргументов
input_name = str(argv[1])
stage = str(argv[2])
output_name = str(argv[3])
title = str(argv[4])

if output_name == '-0-':
    custom_path = False
    if stage == 'no_trend':
        output_name = 'no_trend'

    if stage == 'per':
        output_name = 'periodogram'

    if stage == 'corr':
        output_name = 'correlogram'

    if stage == 'w_per':
        output_name = 'weighted_periodogram'

else:
    custom_path = True

if title == '-0-':
    if stage == 'no_trend':
        title = 'После извлечения тренда'
        xlabel = 'Время'
        ylabel = 'Значение'

    elif stage == 'per':
        title = 'Периодограмма'
        xlabel = 'Частота'
        ylabel = 'Значение'

    elif stage == 'corr':
        title = 'Коррелограмма'
        xlabel = 'Время'
        ylabel = 'Значение'

    elif stage == 'w_per':
        title = 'Сглаженная периодограмма'
        xlabel = 'Частота'
        ylabel = 'Значение'

# Настройки графиков

## Настройка DPI
rcP["savefig.dpi"] = 300
rcP["figure.dpi"] = 300

## Включение поддержки TeX
rcP["text.usetex"] = True

## Включение поддержки русского языка
rcP["text.latex.preamble"] = [r'\usepackage[main=russian,english]{babel}',
                              r'\usepackage{cmsrb}']

## Установка семейства шрифтов для текста внутри математической моды
rcP['mathtext.fontset'] = 'cm'

## Установка размеров шрифта
rcP["font.size"] = 18
rcP["legend.fontsize"] = 12

# Считывание данных из файла

## Создание пустого списка
lines = []

if stage == 'no_trend': 

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
if stage == 'per':
    plt.axhline(y=threshold, color="#635D9E", alpha=0.5, linestyle="--")
    plt.text(x[-1] * 0.915, threshold * 1.075, r'\textrm{' + str((1 - q) * 100) + '\%}', fontsize=12)

## Добавление заголовка
plt.title(r'\textrm{' + title + '}')

## Добавление названий осей
plt.xlabel(r'\textrm{' + xlabel + '}')
plt.ylabel(r'\textrm{' + ylabel + '}')

## Показ графика
plt.show()

## Сохранение фигуры
if custom_path:
    f.savefig(output_name + ".pdf", bbox_inches='tight')
else:
    f.savefig("Фигуры/" + output_name + ".pdf", bbox_inches='tight')