import 'package:flutter/material.dart';

class ListarRegistroEquipo extends StatelessWidget {
  static const String ROUTE = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listar Equipo"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
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
