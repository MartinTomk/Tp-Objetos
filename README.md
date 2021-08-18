# Trabajo Práctico Individual: Mensajeros de Película
## Primera entrega: Destinos y mensajeros
1. Desarrollar y probar un programa que me permita saber si el paquete puede ser entregado por un mensajero. Un paquete puede entregarse cuando el mensajero puede llegar al destino indicado y además el paquete está pago.

Destinos posibles:
- Puente de Brooklyn: deja pasar a todo lo que pese hasta una tonelada.
- La Matrix: deja entrar a quien pueda hacer una llamada.

Mensajeros posibles:
- Roberto: Roberto viaja en bicicleta o camión. Si viaja en bicicleta, el peso que cuenta es el suyo propio más 1, que es lo que pesa la bici. Si viaja en camión, el peso es el propio más el del camión, a razón de media tonelada por cada acoplado. Roberto no tiene un mango, gracias que tiene cubiertas, y no puede llamar a nadie.
- Chuck Norris: Chuck norris pesa 900 kg y puede llamar a cualquier persona del universo con sólo llevarse el pulgar al oído y el meñique a la boca
- Neo vuela, así que no pesa nada. Y anda con celular, el muy canchero. El tema es que a veces no tiene crédito para hacer llamadas.

**Tests**
2. Realizar una serie de tests, donde se prueben las diferentes situaciones, entre ellas:
- Que roberto (90kg) puede llevar un paquete que está pago en un camión que tiene un acoplado.
- Que neo con crédito no puede llevar un paquete que no está pago a la matrix.

***Nota importante: Los nombres de los tests tienen que describir la clase de equivalencia que están testeando (la parte de la lógica que representan). Ejemplos:
Mal nombre: “el año 2020 es bisiesto”. Buen nombre: “Un año múltiplo de 4 es bisiesto”.***

## Segunda entrega: Empresa de mensajería
Ahora aparece una empresa de mensajería. Esta tiene un conjunto de mensajeros, los cuales podrían ser Roberto, Chuck y Neo.

Se necesita poder hacer:
 1. Contratar a un mensajero
 2. Despedir a un mensajero
 3. Despedir a todos los mensajeros
 4. Analizar si la mensajeria es grande (si tiene más de dos mensajeros)
 5. Consultar si el paquete puede ser entregado por el primer empleado de la empresa de mensajería.
 6. Saber el peso del último mensajero de la empresa.
 7. Surgen otros paquetes que la empresa necesita enviar:
	- Paquetito: es gratis, o sea, siempre está pago. Además, cualquier mensajero lo puede llevar.
	- Paqueton viajero: tiene múltiples destinos. Su precio es 100$ por cada destino. Se puede ir pagando parcialmente y se debe pagar totalmente para poder ser enviado. 
	Además, el mensajero debe poder pasar por todos los destinos.
	- Se sabe que el paquete original tiene un precio determinado en $50.

	Se necesita realizar, teniendo en cuenta estos nuevos paquetes:

	**a.**  Averiguar si un paquete puede ser entregado por la empresa de mensajería, es decir, si al menos uno de sus mensajeros puede entregar el paquete.
	
	**b.**  Obtener todos los mensajeros que pueden llevar un paquete dado.
	
	**c.** Saber si una mensajería tiene sobrepeso. Esto sucede si el promedio del peso de los mensajeros es superior a 500 Kg.
	
	**d.** Hacer que la empresa de mensajería envíe un paquete. Para ello elige cualquier mensajero entre los que pueden enviarlo y si no puede lo agrega a los paquetes pendientes.
	
	**e.** Dado un conjunto de paquetes, enviarlos a todos, de igual manera.
	
	**f.** Encontrar el paquete pendiente más caro y enviarlo, actualizando los pendientes en caso de haberlo podido enviar.
	
	**g.** Agregar un nuevo mensajero y un nuevo paquete y garantizar que todo siga funcionando
	
	
**Cada punto debe tener mínimo un test**
