import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    debugShowCheckedModeBanner: false,
    home: juegov2(),
  ));
}

int turno= 0;

MaterialButton pieza = MaterialButton(
  padding: const EdgeInsets.all(0.5),
  minWidth: 66,
  height: 390,
  onPressed: () {cambiaColor(pieza);},
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
      Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
      Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
      Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
      Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
      Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      )
    ],
  ),
);

class juegov2 extends StatelessWidget {
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
                child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      pieza,
                      pieza,
                      pieza,
                      pieza,
                      pieza,
                      pieza
                    ],
                  )
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


void cambiaColor(MaterialButton tb) {
  if(tb.color == Colors.white){
    if(turno%0==0){
      tb.color == Colors.red;
    } else{
      tb.color == Colors.blueAccent;
    }
  }
  turno++;
  // https://es.stackoverflow.com/questions/540915/cambiar-color-de-fondo-por-parametro-en-flutter
}
