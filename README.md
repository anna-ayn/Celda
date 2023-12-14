# Celda

### Ana Shek - 1910096

### Andrea Diaz - 1810826

### Jeamhowards Montiel - 1910234

## Como ejecutar el programa

Primero, debe cargar el Celda.pl para poder usar sus predicados. Para cargar un archivo con un mapa, la ubicación del archivo debe ser de la siguiente manera c:/documentos/prolog/mapa sin colocar la extensión del archivo donde se encuentra el mapa. El mapa dentro de este archivo debe terminar con un punto (.) como cualquier predicado en prolog. En el predicado de leer, debe manualmente escribir la extensión del archivo donde se encuentra el mapa si la misma es distinta a .txt. Luego, puede utilizar el mapa generado en cualquier predicado. 

## Detalles importantes de la implementación del proyecto

### **cruzar\3**

### **es_seguro\3**

### **quitar_ultimo\2**

### **atravesar\3**

### **siempre_seguro\1**

### **siempre_seguro_bifurcacion\2**

### **string_insert\4**

### **leer\1**
Este predicado sirve para leer un mapa dentro de un archivo del usuario y unificarlo en la variable Mapa. Primero, le pide que introduzca el nombre del archivo donde se encuentra el mapa a utilizar, luego se lee esta respuesta con el predicado read. Luego se toma el la longitud del string y se inserta al final de este la extension del archivo. Luego, se utiliza el predicado atom_string para llevar este string resultante a un atomo ya que el predicado see solo funciona con atomos. Por ultimo, se llama a see con este atomo resultante, se unifica en Mapa y se cierra el input stream con el predicado seen. 

