import 'package:flutter/material.dart';
import 'package:flutter_application_1/jhome.dart';

void main() {
  final ThemeData thema = ThemeData();

  runApp(MaterialApp(
    theme: ThemeData().copyWith(
        colorScheme: thema.colorScheme.copyWith(
      primary: Colors.amber,
    )),
    home: JokemPoHome(),
    debugShowCheckedModeBanner: false,
  ));
}
