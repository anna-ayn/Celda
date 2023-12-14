# Celda

### Ana Shek - 1910096

### Andrea Diaz - 1810826

### Jeamhowards Montiel - 1910234

## Como ejecutar el programa

Primero, debe cargar el Celda.pl para poder usar sus predicados. Para cargar un archivo con un mapa, la ubicación del archivo debe ser de la siguiente manera c:/documentos/prolog/mapa sin colocar la extensión del archivo donde se encuentra el mapa. El mapa dentro de este archivo debe terminar con un punto (.) como cualquier predicado en prolog. En el predicado de leer, debe manualmente escribir la extensión del archivo donde se encuentra el mapa si la misma es distinta a .txt. Luego, puede utilizar el mapa generado en cualquier predicado. 

## Detalles importantes de la implementación del proyecto

### **cruzar\3**

### **es_seguro\3**
Este predicado toma 3 argumentos: modo del pasillo, posición de la palanca y si es seguro pasar o es trampa. Y con este predicado, se definen 4 hechos:
1. `es_seguro(regular, arriba, seguro)`: Si el modo es regular y la palanca está hacia arriba, es seguro cruzar.
2. `es_seguro(de_cabeza, abajo, seguro)`: Si el modo está de_cabeza y la palanca está hacia abajo, es seguro cruzar.
3. `es_seguro(de_cabeza, arriba, trampa)`: Si el modo está de cabeza y la palanca está hacia arriba, entonces no es seguro cruzar.
4. `es_seguro(regular, abajo, trampa)`: Si el modo es regular y la palanca está hacia abajo, tampoco es seguro de cruzar.

### **quitar_ultimo\2**
Este predicado recibe una lista de entrada y devuelve la lista resultante luego de eliminar el último elemento.

### **atravesar\3**

### **siempre_seguro\1**

### **siempre_seguro_bifurcacion\2**

### **string_insert\4**
Este predicado toma Str un string (donde se realizara la insercion), Val otro string (lo que se insertará), At un numero donde se insertará el string y el string resultante NewStr. Primero, se llama al predicado sub_string para obtener el substring S1 de Str que va desde el primer caracter hasta el que se encuentra en At, luego se vuelve a llamar para conseguir el substring S2 que va desde At hasta el ultimo caracter de Str. Luego, utiliza el predicado atomics_to_string para llevar la concatenacion de S1 con Val y S2 a un string que se guardará en NewStr.

### **leer\1**
Este predicado sirve para leer un mapa dentro de un archivo del usuario y unificarlo en la variable Mapa. Primero, le pide que introduzca el nombre del archivo donde se encuentra el mapa a utilizar, luego se lee esta respuesta con el predicado read. Luego se toma el la longitud del string y se inserta al final de este la extension del archivo. Luego, se utiliza el predicado atom_string para llevar este string resultante a un atomo ya que el predicado see solo funciona con atomos. Por ultimo, se llama a see con este atomo resultante, se unifica en Mapa y se cierra el input stream con el predicado seen. 

