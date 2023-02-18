import 'package:flutter/material.dart';
import 'package:juegoflutter/juego.dart';

void main() {
  List<List<int>> matrix = <List<int>>[];
for (var i = 0; i < 6; i++) {
  List<int> list = <int>[];

  for (var j = 0; j < 6; j++) {
    list.add(0);
  }

  matrix.add(list);
}

  for (var j = 5; j > -1; j--) {
    if (matrix[j][1] == 0) {
      matrix[j][1] = 3;
      break;
    }
  }



    print(matrix);

}