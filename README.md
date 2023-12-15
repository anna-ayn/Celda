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

### **string_insert\4**
Este predicado toma Str un string (donde se realizara la insercion), Val otro string (lo que se insertará), At un numero donde se insertará el string y el string resultante NewStr. Primero, se llama al predicado sub_string para obtener el substring S1 de Str que va desde el primer caracter hasta el que se encuentra en At, luego se vuelve a llamar para conseguir el substring S2 que va desde At hasta el ultimo caracter de Str. Luego, utiliza el predicado atomics_to_string para llevar la concatenacion de S1 con Val y S2 a un string que se guardará en NewStr.

### **leer\1**
Este predicado sirve para leer un mapa dentro de un archivo del usuario y unificarlo en la variable Mapa. Primero, le pide que introduzca el nombre del archivo donde se encuentra el mapa a utilizar, luego se lee esta respuesta con el predicado read. Luego se toma el la longitud del string y se inserta al final de este la extension del archivo. Luego, se utiliza el predicado atom_string para llevar este string resultante a un atomo ya que el predicado see solo funciona con atomos. Por ultimo, se llama a see con este atomo resultante, se unifica en Mapa y se cierra el input stream con el predicado seen. 

