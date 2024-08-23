#!/bin/bash

# Создаем каталог task с вложенными директориями
mkdir -p task/dir1 task/dir2 task/dir3/dir4

# Изменяем текущую директорию на task
cd task

# Создаем пустой файл dir2/empty
touch dir2/empty

# Создаем файл dir2/hello.sh с содержимым
cat > dir2/hello.sh << 'EOF'
#!/bin/bash
echo "$1, привет!"
EOF

# Устанавливаем для dir2/hello.sh права rwxrw-r--
chmod 764 dir2/hello.sh

# Сохраняем список файлов dir2 в dir2/list.txt
ls dir2 > dir2/list.txt

# Копируем содержимое dir2 в dir3/dir4
cp -r dir2/* dir3/dir4

# Записываем в dir1/summary.txt список файлов с расширением *.txt в task, включая поддиректории
find . -name '*.txt' > dir1/summary.txt

# Дописываем в dir1/summary.txt содержимое dir2/list.txt
cat dir2/list.txt >> dir1/summary.txt

# Определяем переменную окружения NAME
export NAME="Всем студентам"

# Запускаем dir2/hello.sh с переменной NAME в качестве аргумента
# Вывод дописывается в dir1/summary.txt
./dir2/hello.sh "$NAME" >> dir1/summary.txt

# Перемещаем с переименованием dir1/summary.txt в Практическое задание
mv dir1/summary.txt "Практическое задание"

# Выводим на консоль содержимое файла Практическое задание
cat "Практическое задание"

# Ищем в файле "Практическое задание" строки, которые содержат слово "dir" и отсортировываем их
grep "dir" "Практическое задание" | sort

# Меняем текущую директорию на родительскую для task
cd ..

# Удаляем директорию task со всем содержимым
rm -rf task
