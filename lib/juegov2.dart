// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
//import 'dart:convert';
//import 'dart:io';

List<Color> turnos = [Colors.white, Colors.amber];
int turno = 0;
List<List<Color>> matrix = <List<Color>>[];
bool ganado = false;
String playerGanador = '';

void main() {
  crearMatrizVacia();
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    debugShowCheckedModeBanner: false,
    home: juegov2(),
  ));
}

class juegov2 extends StatefulWidget {
  const juegov2({super.key});

  @override
  State<juegov2> createState() => _juegov2State();
}

class _juegov2State extends State<juegov2> {
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
            children: [
              Text(
                'Player 1',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    backgroundColor: turnos[1]),
              ),
              Text('Player 2',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      backgroundColor: turnos[0])),
            ],
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
          SizedBox(
              height: 30,
              child: Text(
                  playerGanador,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)
              )
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

  void cambiaColor(int columna) {
    if (!ganado) {
      for (var j = 5; j > -1; j--) {
        if (matrix[j][columna] == Colors.white) {
          turno++;
          if (turno % 2 == 0) {
            turnos[1] = Colors.amber;
            turnos[0] = Colors.white;
            matrix[j][columna] = Colors.red;
          } else {
            turnos[0] = Colors.amber;
            turnos[1] = Colors.white;
            matrix[j][columna] = Colors.blueAccent;
          }
          break;
        }
      }
      ganador();
      if (ganado) {
        turnos[1] = Colors.white;
        turnos[0] = Colors.white;
        turnos[turno % 2] = Colors.amber;
        int jugador = turno % 2;
        if (jugador == 0) {
          jugador = 2;
        }
        playerGanador = 'Ganador Player $jugador';
        //almacenar(jugador);
      }
    }
    setState(() {});
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

void ganador() {
  for (int i = 0; i < 6; i++) {
    for (int j = 0; j < 3; j++) {
      if (matrix[i][j] != Colors.white &&
          matrix[i][j] == matrix[i][j + 1] &&
          matrix[i][j] == matrix[i][j + 2] &&
          matrix[i][j] == matrix[i][j + 3]) {
        ganado = true;
      }
    }
  }

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 6; j++) {
      if (matrix[i][j] != Colors.white &&
          matrix[i][j] == matrix[i + 1][j] &&
          matrix[i][j] == matrix[i + 2][j] &&
          matrix[i][j] == matrix[i + 3][j]) {
        ganado = true;
      }
    }
  }

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (matrix[i][j] != Colors.white &&
          matrix[i][j] == matrix[i + 1][j + 1] &&
          matrix[i][j] == matrix[i + 2][j + 2] &&
          matrix[i][j] == matrix[i + 3][j + 3]) {
        ganado = true;
      }
    }
  }

  for (int i = 0; i < 3; i++) {
    for (int j = 3; j < 6; j++) {
      if (matrix[i][j] != Colors.white &&
          matrix[i][j] == matrix[i + 1][j - 1] &&
          matrix[i][j] == matrix[i + 2][j - 2] &&
          matrix[i][j] == matrix[i + 3][j - 3]) {
        ganado = true;
      }
    }
  }
}

void almacenar(int player){
/**
  Map<String, dynamic> toJson() =>
      {'player': player, 'date': DateTime.now().toIso8601String()};
  var jsonString = jsonEncode(toJson());
  final file = File('winner.json');
  file.writeAsStringSync(jsonString);
    */

}
