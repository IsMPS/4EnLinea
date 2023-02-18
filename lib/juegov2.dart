import 'package:flutter/material.dart';

int turno = 1;
List<List<Color>> matrix = <List<Color>>[];

void main() {
  crearMatrizVacia();
  runApp(MaterialApp(
    title: 'Navigation Basics',
    debugShowCheckedModeBanner: false,
    home: juegov2(),
  ));
}

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton(context, 0),
                      buildButton(context, 1),
                      buildButton(context, 2),
                      buildButton(context, 3),
                      buildButton(context, 4),
                      buildButton(context, 5),
                    ],
                  ))
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

void cambiaColor(int columna) {
  for (var j = 5; j > -1; j--) {
    if (matrix[j][columna] == Colors.white) {
      if (turno % 2 == 0) {
        matrix[j][columna] = Colors.red;
      } else {
        matrix[j][columna] = Colors.blueAccent;
      }
      break;
    }
  }
  turno++;
}

void crearMatrizVacia() {
  for (var i = 0; i < 6; i++) {
    List<Color> list = <Color>[];
    for (var j = 0; j < 6; j++) {
      list.add(Colors.white);
    }
    matrix.add(list);
  }
}

  Widget buildButton(BuildContext context, int columna) {
    return MaterialButton(
      padding: const EdgeInsets.all(0.5),
      minWidth: 66,
      height: 390,
      onPressed: () {
        cambiaColor(columna);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(width: 60, height: 60, color: matrix[0][columna]),
          Container(width: 60, height: 60, color: matrix[1][columna]),
          Container(width: 60, height: 60, color: matrix[2][columna]),
          Container(width: 60, height: 60, color: matrix[3][columna]),
          Container(width: 60, height: 60, color: matrix[4][columna]),
          Container(width: 60, height: 60, color: matrix[5][columna]),
        ],
      ),
    );
  }
