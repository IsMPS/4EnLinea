import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    debugShowCheckedModeBanner: false,
    home: juego(),
  ));
}

int turno= 0;
TextButton pieza = TextButton(
    style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(20)
    ),
    onPressed: (
        ) {cambiaColor(pieza);},
    child: Text('')
);

class juego extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(children: [
            Container(
              height: 40,
            ),
            /**
                TextButton(
                style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                padding: const EdgeInsets.only(left: 100, right: 100),
                textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Inicio()),
                );},
                child: const Text('Inicio'),
                ),
                TextButton(
                style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                padding: const EdgeInsets.only(left: 60, right: 60),
                textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Instagram()),
                );},
                child: const Text('Instagram'),
                ),
                TextButton(
                style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                padding: const EdgeInsets.only(left: 100, right: 100),
                textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Final()),
                );},
                child: const Text('Final'),
                ),
             */
          ]),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Center(
            child: Text(
              'El 4 en línea',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body:
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                'Player 1',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Player 2',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                height: 400,
                width: 400,
                child: GridView.count(
                  crossAxisCount: 6,
                  children:
                  // Aqui se generaría una lista más larga
                  List.generate(36, (index) {
                    return Center(
                        child: Container(
                        margin: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                    color: Colors.white,
                    ),
                    child:
                    /**
                     * Colocar un botón con funcionalidad de si es blanco colorear de rojo o azul dependiendo el número del
                     * turno si es par o impar
                     * par = player2
                     * impar = player1 (empieza)
                     * Si está blanco se puede colorear
                     * Si no está blanco (está azul o rojo) se bloqueará la funcionalidad
                     * if(color.white) -> colorear turno%0(==0 - rojo)  (!=0 - azul)
                     * Refrescar la vista
                     *
                     *
                     */
                          pieza
                    ));
                  }),
                ),
              )
            ],
          ),
          Container(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                ),
                onPressed: () {},
                child: Image.asset("images/copa.png"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                ),
                onPressed: () {},
                child: Image.asset("images/copa.png"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                ),
                onPressed: () {},
                child: Image.asset("images/copa.png"),
              ),
            ],
          ),
          // Botones de abajo juego y copa(clasificación)
        ]));
  }
}


void cambiaColor(TextButton tb) {
  if(tb.style?.backgroundColor == Colors.white){
    if(turno%0==0){
      tb.style?.backgroundColor == Colors.red;
    } else{
      tb.style?.backgroundColor == Colors.blueAccent;
    }
  }
  turno++;
  // https://es.stackoverflow.com/questions/540915/cambiar-color-de-fondo-por-parametro-en-flutter
}
