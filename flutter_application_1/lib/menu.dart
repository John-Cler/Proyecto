import 'package:flutter/material.dart';
import 'package:flutter_application_1/listarEquipo.dart';
import 'package:flutter_application_1/login.dart';
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
      home: const Menu(),
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
          backgroundColor: Colors.indigo[900],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "lib/assets/logo.png",
                fit: BoxFit.contain,
                height: 42,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text("Menu principal",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              )
            ],
          )),
      drawer: Drawer(
        backgroundColor: Colors.amber,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors
                    .indigo[900], //define el color del contenedor de drawer
                child: DrawerHeader(
                  child: Image.asset("lib/assets/appbar.png"),
                ),
              ),
              //Inicio de ListTitle de Administrador
              const ListTile(
                title: Text(
                  "Bienvenido",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ), //  Fin de ListTitle de Administrador
              //Inicio de ListTilte de Home
              Container(
                margin: const EdgeInsets.only(top: 1),
                padding: const EdgeInsets.all(1),
                color: Colors.indigo[900],
                child: const ListTile(
                  title: Text(
                    "Menu de opciones",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              ),
              //contenedor de Registrar
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.all(1),
                color: Colors.indigo[900],
                width: double.infinity,
                child: ExpansionTile(
                  title: const Text(
                    "Registro",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                  // backgroundColor: Colors.blue[400],
                  children: <Widget>[
                    ListTile(
                      title: const Text(
                        "Registro de equipos",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                            context, ListarRegistroEquipo.ROUTE);
                      },
                    ),
                    ListTile(
                      title: const Text(
                        "Registro de persona",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, RegistrarPersona.ROUTE);
                      },
                    )
                  ],
                ),
              ), //Fin del contenedor de Registro
              //Contenedor de Mantenimiento
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.all(1),
                color: Colors.indigo[900],
                child: ListTile(
                  title: const Text(
                    "Mantenimiento",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                  // tileColor: Colors.amber,
                  onTap: () {
                    Navigator.pushNamed(context, ListarRegistroEquipo.ROUTE);
                  },
                ),
              ), //Fin del container de Mantenimiento
              //Container de Reporte
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.all(1),
                color: Colors.indigo[900],
                child: ListTile(
                  title: const Text(
                    "Reporte",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                  // tileColor: Colors.blue[400],
                  onTap: () {
                    // Add navigation or functionality here
                  },
                ),
              ), //Fin del container de Reporte
              //Inicio del container de Seguimiento
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.all(1),
                color: Colors.indigo[900],
                child: ListTile(
                  title: const Text(
                    "Seguimiento",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                  // tileColor: Colors.blue[400],
                  onTap: () {
                    // Add navigation or functionality here
                  },
                ),
              ), //Fin del container de Seguimiento
              //Inicio de container de Asignacion
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.all(1),
                color: Colors.indigo[900],
                child: ListTile(
                  title: const Text(
                    "Asignación",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                  // tileColor: Colors.blue[400],
                  onTap: () {
                    // Add navigation or functionality here
                  },
                ),
              ),
              //Inicio de container de Sign out
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.all(1),
                child: ListTile(
                  title: const Text(
                    textAlign: TextAlign.center,
                    "Sign out",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                  tileColor: const Color.fromARGB(255, 180, 32, 21),
                  onTap: () {
                    Navigator.pushNamed(context, Login.ROUTE);
                  },
                ),
              ), //Fin del container de Sign out
            ],
          ),
        ),
      ),
    );
  }
}
