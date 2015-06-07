# Práctica de TDD para iOS

**Alumno:** Julio Martínez Ballester

**Fecha de entrega:** 16-06-2015

## Wallet
Aplicación para representar en una tabla dinero en diferentes divisas y la suma total en €. Desarrollada para poner en práctica los conecptos adquiridos en el curso de TDD.

## Comentarios
- La elección del model no es ni mucho menos la óptima. Pero la he eligido porque así me he visto obligado a hacer varios test de cosas muy susceptibles de fallar.
- Al realizar cambios gordos en el modelo he podido darme cuenta de la gran utilidad de aplicar TDD. Me han permitido detectar muy rápidamente dónde estaban los cambios que se me habían pasado y confiar en que lo que resultó estaba bien.
- He interpretado el método addMoney: como el plus: del protocolo que implementan tanto la clase Money como Wallet. El método takeMoney: lo he interpretado como el encargado de servir el money correspondiente al data source de la tabla, takeMoneyAtIndexPath:.