
     ## Это шаблон* make-файла для публикации кода на GitHub.

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

     ## Заглушка на вывод сообщений указанными правилами
     ## (без указания имён подавляет вывод со стороны make-файла у всех правил)

     .SILENT :

     ## Правила-псевдоцели
     .PHONY : git, git-am, git-new, git-clean

     ## Правило, выполняющееся при вызове координатора без аргументов
     ALL : git



     # Блок правил для разработки и публикации кода на GitHub

     ## Имя пользователя на GitHub
     username := Paveloom

     ## Правило для создания и публикации коммита

     git :
	      git add -A
	      git commit -e
	      git push

     ## Правило для обновления последнего коммита до текущего состояния локального репозитория

     git-am :
	         git add -A
	         git commit --amend
	         git push --force-with-lease

     # Правило для создания архивов

     archive :
	          cd Программа/ && find . -path '*/.*' -prune -o -type f -print | zip ../Архивы/Программа.zip -FS -q -@
