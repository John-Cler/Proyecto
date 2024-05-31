import 'package:flutter/material.dart';
import 'package:flutter_application_1/listarEquipo.dart';
import 'package:flutter_application_1/registrarEquipo.dart';
import 'package:flutter_application_1/registrarPersona.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

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

  const Menu({super.key});

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
                margin: const EdgeInsets.all(20),
                child: Image.asset("lib/assets/appbar.png"),
              ),
              const Text(
                "Administrador",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.blue[700],
                alignment: Alignment.center,
                child: const Text(
                  "Home",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.blue[400],
                child: const Text(
                  "Registrar",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.blue[400],
                child: const Text(
                  "Mantenimiento",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.blue[400],
                child: const Text(
                  "Reporte",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.blue[400],
                child: const Text(
                  "Seguimiento",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.blue[400],
                child: const Text(
                  "Asignación",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              Expanded(child: Container()),
              Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: const Color.fromARGB(255, 180, 32, 21),
                alignment: Alignment.center,
                child: const Text(
                  "Sign outt",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
