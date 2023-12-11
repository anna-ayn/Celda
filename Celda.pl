/* quitar el ultimo elemento en una lista */
quitar_ultimo([], []).
quitar_ultimo([X|Xs], [X|Ys]) :- quitar_ultimo(Xs, Ys),!.

/* Es seguro cruzar si: el modo del pasillo es regular y la palanca es arriba 
o si el modo es de_cabeza y la palanca es abajo: */
es_seguro(regular, arriba, seguro).
es_seguro(de_cabeza, abajo, seguro).
/* No se puede cruzar si: el modo del pasillo es regular y la palanca es abajo
o si el modo es de_cabeza y la palanca es arriba: */
es_seguro(de_cabeza, arriba, trampa).
es_seguro(regular, abajo, trampa).

/* predicado cruzar */

cruzar(Mapa, Palancas, Seguro) :-
    /* se llama a una funcion auxiliar: atravesar */
    atravesar(Mapa, Palancas, Seguro),
    quitar_ultimo(Palancas, Palancas).

/* predicado atravesar */

/* Caso en que la Mapa o Submapa es un pasillo(X, Modo) */
atravesar(pasillo(X, Modo), Palancas, Seguro) :-
    /* se busca si existe un elemento en la lista de Palancas tal que tenga la letra X */
    memberchk((X, Posicion), Palancas),
    /* Luego se verifica si el modo de pasillo es igual al modo de la palanca dependiendo del valor de Seguro */
    es_seguro(Modo, Posicion, Seguro).

/* Caso en que la Mapa o Submapa es una secuencia de dos submapas: junta(Submapa1, Submapa2) */
atravesar(junta(Submapa1, Submapa2), Palancas, seguro):- 
    atravesar(Submapa1, Palancas, seguro),
    atravesar(Submapa2, Palancas, seguro).

atravesar(junta(Submapa1, Submapa2), Palancas, trampa):- 
    atravesar(Submapa1, Palancas, trampa),
    atravesar(Submapa2, Palancas, trampa).

atravesar(junta(Submapa1, Submapa2), Palancas, trampa):- 
    atravesar(Submapa1, Palancas, seguro),
    atravesar(Submapa2, Palancas, trampa).

atravesar(junta(Submapa1, Submapa2), Palancas, trampa):- 
    atravesar(Submapa1, Palancas, trampa),
    atravesar(Submapa2, Palancas, seguro).

/* Caso en que la Mapa o Submapa es una bifurcacion del camino de dos submapas: bifurcacion(Submapa1, Submapa2) */
atravesar(bifurcacion(Submapa1, Submapa2), Palancas, seguro):- 
    atravesar(Submapa1, Palancas, seguro),
    atravesar(Submapa2, Palancas, seguro).

atravesar(bifurcacion(Submapa1, Submapa2), Palancas, seguro):- 
    atravesar(Submapa1, Palancas, trampa),
    atravesar(Submapa2, Palancas, seguro).

atravesar(bifurcacion(Submapa1, Submapa2), Palancas, seguro):- 
    atravesar(Submapa1, Palancas, seguro),
    atravesar(Submapa2, Palancas, trampa).

atravesar(bifurcacion(Submapa1, Submapa2), Palancas, trampa):- 
    atravesar(Submapa1, Palancas, trampa),
    atravesar(Submapa2, Palancas, trampa).
    
/*Predicado para insertar en un string otro string en una posición especificada*/
 string_insert(Str, Val, At, NewStr) :-
    sub_string(Str, 0, At, A1, S1),
    sub_string(Str, At, A1, _, S2),
    atomics_to_string([S1,Val,S2], NewStr).   

/*Predicado para leer por input el nombre del archivo donde se encuentra el mapa (el archivo debe terminar con un punto)*/
/* (debe colocar en el predicado string_insert la extensión del archivo a leer)*/
leer(Mapa):-
    write("Introduza el nombre del archivo donde se encuentra su mapa: "),    read(Nombre),
     string_length(Nombre,Length),
     string_insert(Nombre,".txt",Length,Ubicacion),
     atom_string(Atomubicacion,Ubicacion),
     see(Atomubicacion),
     read(X),
     Mapa = X,
     seen.
