# Скрипт для визуализации входных данных

# Подключение модулей

## Подключение модуля numpy
import numpy as np

## Подключение модуля для получения базовых имен файлов
from os.path import basename

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
    if stage == 'periodogram':
        output_name = 'periodogram'
else:
    custom_path = True

if title == '-0-':
    if stage == 'no_trend':
        title = 'После извлечения тренда'
        xlabel = 'Время'
        ylabel = 'Значение'
    elif stage == 'periodogram':
        title = 'Периодограмма'
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

elif stage == 'periodogram':

    ## Считывание строк с данными
    with open(input_name) as f:
        for line in islice(f, 13, 17, 3):
            lines.append(line)

    ## Получение значений массива частот периодограммы
    x = np.array(lines[0].split(), dtype = np.float)

    ## Получение значений массива значений периодограммы
    y = np.array(lines[1].split(), dtype = np.float) 

# Создание и сохранение фигуры

## Создание фигуры
f = plt.figure()

## Создание графика
plt.plot(x, y, color="#425378")

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