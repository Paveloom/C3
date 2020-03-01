#!/bin/bash

# Скачивание пакета MacPorts 2.6 для macOS 10.15 Catalina

printf "\n Выполняется скачивание пакета.\n\n"
curl -O https://github.com/macports/macports-base/releases/download/v2.6.2/MacPorts-2.6.2-10.15-Catalina.pkg

# Установка пакета

printf "\n Выполняется установка пакета."
sudo installer -pkg MacPorts-2.6.2-10.15-Catalina.pkg -target /

