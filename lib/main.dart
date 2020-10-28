import 'package:flutter/material.dart';
import 'package:flutter_pokedex/pokemon_list.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Karakterleri',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Genel',
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:PokemonList(),
    );
  }
}
