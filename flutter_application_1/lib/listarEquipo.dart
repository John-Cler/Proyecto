import 'package:flutter/material.dart';
import 'package:flutter_application_1/registrarEquipo.dart';

class ListarRegistroEquipo extends StatelessWidget {
  static String ROUTE = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, RegistrarEquipo.ROUTE);
        },
      ),
      appBar: AppBar(
        title: const Text("Lista de equipos por John clever asi nomas"),
      ),
      body: Container(
        child: ListView(
          children: const <Widget>[
            ListTile(
              title: Text("Equipo 1 "),
            ),
            ListTile(
              title: Text("Equipo 2 "),
            ),
            ListTile(
              title: Text("Equipo 3 "),
            ),
            ListTile(
              title: Text("Equipo 4 "),
            ),
            ListTile(
              title: Text("Equipo 5 "),
            ),
            ListTile(
              title: Text("Equipo 6 "),
            ),
            ListTile(
              title: Text("Equipo 7 "),
            ),
            ListTile(
              title: Text("Equipo 8 "),
            ),
            ListTile(
              title: Text("Equipo 9 "),
            ),
            ListTile(
              title: Text("Equipo 10 "),
            ),
            ListTile(
              title: Text("Equipo 11 "),
            ),
            ListTile(
              title: Text("Equipo 12 "),
            ),
            ListTile(
              title: Text("Equipo 13 "),
            ),
          ],
        ),
      ),
    );
  }
}
