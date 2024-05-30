import 'package:flutter/material.dart';
import 'package:flutter_application_1/listarEquipo.dart';
import 'package:flutter_application_1/registrarEquipo.dart';

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
      body: Center(
        child: const Text("Selecciona una opción del menú"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú de opciones',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ExpansionTile(
              title: const Text('Registrar'),
              children: <Widget>[
                ListTile(
                  title: const Text('Registrar Equipo'),
                  onTap: () {
                    Navigator.pushNamed(context, RegistrarEquipo.ROUTE);
                  },
                ),
                ListTile(
                  title: const Text('Registrar Personal'),
                  onTap: () {
                    Navigator.pushNamed(context, ListarRegistroEquipo.ROUTE);
                  },
                ),
              ],
            ),
            ListTile(
              title: const Text('Reportes'),
              onTap: () {
                // Navegar a la pantalla de Reportes
              },
            ),
            ListTile(
              title: const Text('Seguimiento'),
              onTap: () {
                // Navegar a la pantalla de Seguimiento
              },
            ),
            ListTile(
              title: const Text('Mantenimiento'),
              onTap: () {
                // Navegar a la pantalla de Mantenimiento
              },
            ),
            ListTile(
              title: const Text('Asignación'),
              onTap: () {
                // Navegar a la pantalla de Asignación
              },
            ),
          ],
        ),
      ),
    );
  }
}
