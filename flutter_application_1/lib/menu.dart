import 'package:flutter/material.dart';
import 'package:flutter_application_1/listarEquipo.dart';
import 'package:flutter_application_1/registrarEquipo.dart';
import 'package:flutter_application_1/registrarPersona.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Menu(),
      routes: {
        RegistrarEquipo.ROUTE: (context) => RegistrarEquipo(),
        ListarRegistroEquipo.ROUTE: (context) => ListarRegistroEquipo(),
      },
    );
  }
}

class Menu extends StatelessWidget {
  static String ROUTE = "/menu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu principal"),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                child: Image.asset("lib/assets/appbar.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
