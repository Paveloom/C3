# Скрипт для визуализации входных данных

# Подключение модулей

## Подключения модуля numpy
import numpy as np

## Подключение пакетов для настройки и создания графики
from matplotlib import rcParams as rcP
from matplotlib import pyplot as plt

## Подключение модуля для расширения возможностей итераций
from itertools import islice

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
with open('input') as f:
    for line in islice(f, 1, 8, 3):
        lines.append(line)

## Получение значения размера выборки
N = np.int(lines[0])

## Получение значений массива времени
t = np.array(lines[1].split(), dtype = np.float)

## Получение значений массива значений
x = np.array(lines[2].split(), dtype = np.float)

# Создание и сохранение рисунка

## Создание фигуры
f = plt.figure()

## Создание графика
plt.plot(t, x, color="#425378")

## Добавление заголовка
plt.title(r'\textrm{Исходный временной ряд}')

## Добавление названий осей
plt.xlabel(r'\textrm{Время}')
plt.ylabel(r'\textrm{Значения ряда}')

## Показ графика
plt.show()

## Сохранение фигуры
f.savefig("Фигуры/input.pdf", bbox_inches='tight')