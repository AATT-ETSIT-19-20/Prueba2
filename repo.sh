#!/bin/bash

# Las líneas que comienzan por "#" son consideradas comentarios por el 
# interprete de scripts elegido. Dicho intérprete es el indicado en la
# primera línea del presente script: /bin/bash indicado de esa manera tan 
# especial: con una admiración tras el carácter de comentario #

# Este script debe tener permisos de ejecución que se pueden conseguir, por
# ejemplo, de la siguiente manera:

# chmod u+x repo.sh

# Siempre que se ejecute el presente script se partirá de cero. 
# Se borra el directorio actual:
# se borra cualquier fichero de la forma *.txt y el repositorio local .git
rm -f *.txt 
rm -rf .git

# se inicializa el repositorio (aparece .git)
git init

# Creacion de fichero a.txt con contenido "asdf"
echo "asdf" > a.txt

# Adición al index de cualquier fichero creado, modificado o borrado
git add -A

# Adición al repositorio de lo "novedoso" que pudiera haber en el index
git commit -m "init"

# Se añade la línea 1234 al final del fichero a.txt
# Obsérvese los signos >> que denotan "acumular el contenido indicado
# en el fichero", en vez de el signo > que denota creación de fichero nuevo
# con el contenido indicado
echo "1234" >> a.txt

# Con printf se consigue algo similar a lo conseguido con echo, pero sin
# un salto de línea explícito con cada adición al fichero:
printf "1234 sin nueva linea al final" >> a.txt

# Nuevo commit
git commit -am "Añado 1234 con y sin fin de linea"

# Creación de nueva rama y conmutación inmediata a la misma
git checkout -b rama

# Nueva acumulación (>>) en a.txt
echo "!!!" >> a.txt

# Creación de nuevo fichero b.txt
printf "Contenido de b" > b.txt

# Adición al index de todo lo nuevo, modificado o borrado (en este
# caso tanto de b.txt como de a.txt
git add -A 

# Nuevo commit
git commit -am "b nuevo y admiraciones en a"

# Conmutación a rama master (actualización de index y WD tal y como
# estaba en master cuando fue abandonado
git checkout master

# Adición de línea "..." en a.txt
echo "..." >> a.txt

# Nuevo commit
git commit -am "puntos suspensivos"

# Adición de nueva línea "adios" en a.txt
echo "adios" >> a.txt

# Commit
git commit -am "despedida"



# Log del repositorio con opciones gráficas, todas las ramas y la
# información de cada commit en una única línea
git log --graph --all --oneline



# En principio debería aparecer lo siguiente tras la ejecución de esta 
# última instrucción git:

# * 7431c09 (HEAD -> master) despedida
# * 832ea7d puntos suspensivos
# | * 2fb7e59 (rama) b nuevo y saludo en a
# |/
# * c438c97 Añado 1234
# * c4d3d58 init
