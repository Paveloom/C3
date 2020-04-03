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
output_name = str(argv[2])
title = str(argv[3])
xlim = str(argv[4])
ylim = str(argv[5])

# Настройки по умолчанию для имени выходной фигуры
if output_name == '-0-':
    use_basename = True
    output_name = input_name
else:
    use_basename = False

# Настройки по умолчанию для заголовка
if title == '-0-':
    title = 'Исходный временной ряд'

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
                              r'\usepackage{cmsrb}']

## Установка семейства шрифтов для текста внутри математической моды
rcP['mathtext.fontset'] = 'cm'

## Установка размеров шрифта
rcP["font.size"] = 18
rcP["legend.fontsize"] = 12

# Считывание данных из файла

## Создание пустого списка
lines = []

## Считывание строк с данными
with open(input_name) as f:
    for line in islice(f, 7, 11, 3):
        lines.append(line)

## Получение значений массива времени
t = np.array(lines[0].split(), dtype = np.float)

## Получение значений массива значений
x = np.array(lines[1].split(), dtype = np.float)

# Создание и сохранение фигуры

## Создание фигуры
f = plt.figure()

## Создание графика
plt.plot(t, x, color="#425378")

## Добавление заголовка
plt.title(r'\textrm{' + title + '}')

## Изменение пределов на оси абсцисс
if use_xlim:
    plt.xlim(xlim_a, xlim_b)

## Изменение пределов на оси ординат
if use_ylim:
    plt.ylim(ylim_a, ylim_b)

## Добавление названий осей
plt.xlabel(r'\textrm{Время}')
plt.ylabel(r'\textrm{Значения ряда}')

## Показ графика
plt.show()

## Сохранение фигуры
if use_basename:
    f.savefig("Фигуры/" + basename(output_name) + ".pdf", bbox_inches='tight')
else:
    f.savefig(output_name + ".pdf", bbox_inches='tight')