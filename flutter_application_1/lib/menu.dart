import 'package:flutter/material.dart';
import 'package:flutter_application_1/asignarEquipo.dart';
import 'package:flutter_application_1/listadoUsuarios.dart';
import 'package:flutter_application_1/listarEquipo.dart';
import 'package:flutter_application_1/listarPersona.dart';
import 'package:flutter_application_1/Login/login.dart';
import 'package:flutter_application_1/Mantenimiento/listaMantenimiento.dart';
import 'package:flutter_application_1/registrarDepartamento.dart';
import 'package:flutter_application_1/reporte.dart';
import 'package:flutter_application_1/registrarBloque.dart';

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
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white)),
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
              const ListTile(
                title: Text(
                  "Bienvenido",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
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
                            context, ListarRegistroEquipo.route);
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
                        Navigator.pushNamed(context, ListarPersona.route);
                      },
                    ),
                    ListTile(
                      title: const Text(
                        "Registrar Bloque",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, RegisterBloque.route);
                      },
                    ),
                    ListTile(
                      title: const Text(
                        "Registrar Departamento",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                            context, RegistrarDepartamento.route);
                      },
                    )
                  ],
                ),
              ),
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
                  onTap: () {
                    Navigator.pushNamed(context, ListaMantenimiento.route);
                  },
                ),
              ),
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
                  onTap: () {
                    Navigator.pushNamed(context, Reporte.route);
                  },
                ),
              ),
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
                  onTap: () {
                    Navigator.pushNamed(context, ListadoUsuarios.route);
                  },
                ),
              ),
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
                  onTap: () {
                    Navigator.pushNamed(context, AsignarEquipo.route);
                  },
                ),
              ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
