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

if str(argv[2]) == '-0-':
    use_basename = True
    output_name = input_name
else:
    use_basename = False
    output_name = str(argv[2])

if str(argv[3]) == '-0-':
    title = 'Исходный временной ряд'
else:
    title = str(argv[3])

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
    for line in islice(f, 1, 11, 3):
        lines.append(line)

## Получение значения размера выборки
N = np.int(lines[0])

## Получение значений массива времени
t = np.array(lines[2].split(), dtype = np.float)

## Получение значений массива значений
x = np.array(lines[3].split(), dtype = np.float)

# Создание и сохранение фигуры

## Создание фигуры
f = plt.figure()

## Создание графика
plt.plot(t, x, color="#425378")

## Добавление заголовка
plt.title(r'\textrm{' + title + '}')

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