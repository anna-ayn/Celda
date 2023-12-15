# Celda

### Ana Shek - 1910096

### Andrea Diaz - 1810826

### Jeamhowards Montiel - 1910234

## Como ejecutar el programa

Primero, debe cargar el celda.pl para poder usar sus predicados. Para cargar un archivo con un mapa, se debe utilizar solo el nombre del archivo sin colocar la extensión del archivo donde se encuentra el mapa, este archivo debe encontrarse en la misma carpeta que el programa. El mapa dentro de este archivo debe terminar con un punto (.) como cualquier predicado en prolog. En el predicado de leer, debe manualmente escribir la extensión del archivo donde se encuentra el mapa si la misma es distinta a .txt. Luego, puede utilizar el mapa generado en cualquier predicado. 

## Detalles importantes de la implementación del proyecto

### **cruzar\3**
El predicado "cruzar" se utiliza para recorrer un mapa a través de ciertas palancas garantizando la seguridad. Así, este predicado recibe el mapa a recorrer, una lista de configuraciones de palancas y la condición de seguridad que se desea mantener (seguro/trampa). Y para realizar el recorrido llama al predicado `atravesar\3`, posteriormente a la lista de palancas se le quita el último elemento, esto es debido a que si en la consulta, el usuario llama `cruzar\3` sin instanciar la lista de palancas, entonces habría que crear la lista de disposiciones de las palancas según sea el mapa y la condición de seguridad de si existe un camino para cruzar el laberinto (seguro) o no (trampa), y al terminar de crear esta lista, el último elemento es `_`, y por ello, eliminamos este elemento llamando al predicado `quitar_ultimo\2`.

### **es_seguro\3**
Este predicado toma 3 argumentos: modo del pasillo, posición de la palanca y si es seguro pasar o es trampa. Y con este predicado, se definen 4 hechos:
1. `es_seguro(regular, arriba, seguro)`: Si el modo es regular y la palanca está hacia arriba, es seguro cruzar.
2. `es_seguro(de_cabeza, abajo, seguro)`: Si el modo está de_cabeza y la palanca está hacia abajo, es seguro cruzar.
3. `es_seguro(de_cabeza, arriba, trampa)`: Si el modo está de cabeza y la palanca está hacia arriba, entonces no es seguro cruzar.
4. `es_seguro(regular, abajo, trampa)`: Si el modo es regular y la palanca está hacia abajo, tampoco es seguro de cruzar.

### **quitar_ultimo\2**
Este predicado recibe una lista de entrada y genera la lista resultante luego de eliminar el último elemento.

### **atravesar\3**
Predicado que recibe los mismos 3 argumentos que `cruzar\3` y se define con varias claúsulas para manejar diferentes casos:
1. El primer caso `atravesar(pasillo(X, Modo), Palancas, Seguro)`: Si el mapa es un pasillo con un modo determinado. Comprueba si hay una palanca en la lista de palancas que coincida con la letra del pasillo utilizando la función de Prolog `memberchk` y luego verifica si es seguro cruzar el pasillo dado el modo de la palanca y el modo de seguridad. 
2. El segundo caso `atravesar(junta(Submapa1, Submapa2), Palancas, Seguro)`: Si el mapa es una unión de dos submapas. Comprueba si es seguro cruzar ambos submapas dada la lista de palancas y el modo de seguridad. Hay cuatro combinaciones diferentes de modos de seguridad para los dos submapas: es seguro si ambos son seguros, es trampa si ambos son trampas, es trampa si el primero es seguro y el segundo es una trampa, y viceversa.
3. El tercer caso `atravesar(bifurcacion(Submapa1, Submapa2), Palancas, Seguro)`: Si el mapa es una bifurcación de dos submapas. Comprueba si es seguro cruzar ambos submapas dada la lista de palancas y el modo de seguridad. Hay cuatro combinaciones diferentes de modos de seguridad para los dos submapas: es seguro si ambos son seguros, es trampa si ambos son trampas, es seguro si el primero es seguro y el segundo es una trampa, y viceversa.

### **siempre_seguro\1**
El predicado recibe un mapa y verifica que sea seguro consiguiendo configuraciones de palancas que cumplan que el mapa no es seguro de cruzar, mediante `cruzar(Mapa, _, trampa)`, luego, si existe una configuración de Palancas así, entonces el programa no es seguro, por lo tanto mediante un not podemos verificar si existen configuraciones de palancas que hagan al mapa no seguro, `not(cruzar(Mapa, _, trampa))`.

### **leer\1**
Este predicado sirve para leer un mapa dentro de un archivo del usuario y unificarlo en la variable Mapa. Primero, le pide que introduzca el nombre del archivo donde se encuentra el mapa a utilizar con `write(user_output, "Introduza el nombre del archivo donde se encuentra su mapa: " ), flush_output(user_output)`, el cual `flush_output(user_output)` vacía la salida en el Stream especificado. Luego se lee esta respuesta con `read_string(user_input, "\n", " ", _End, NombreArchivo)`, el cual lee el input del usuario hasta encontrar un carácter de nueva línea (`"\n"`) o un espacio (`" "`). La cadena se almacena en la variable `NombreArchivo`. Posteriormente, se abre el archivo con `open(NombreArchivo, read, Stream)`, luego se lee el contenido del archivo y lo almacena en Mapa con  `read(Stream, Mapa)` y finalmente se cierra el archivo con `close(Stream)`.
