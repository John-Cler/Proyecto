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
        backgroundColor: Colors.grey[300],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.white, //define el color del contenedor de drawer
                child: DrawerHeader(
                  child: Image.asset("lib/assets/appbar.png"),
                ),
              ),
              //Inicio de ListTitle de Administrador
              const ListTile(
                title: Text(
                  "Administrador",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ), //  Fin de ListTitle de Administrador
              //Inicio de ListTilte de Home
              const ListTile(
                title: Text(
                  "Menu de opciones",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                ),
              ),
              //contenedor de Registrar
              Container(
                margin: const EdgeInsets.only(top: 1),
                padding: const EdgeInsets.all(1),
                width: double.infinity,
                child: ListTile(
                  title: const Text(
                    "Registrar",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  tileColor: Colors.blue[400],
                  onTap: () {
                    Navigator.pushNamed(context, RegistrarEquipo.ROUTE);
                  },
                ),
              ), //Fin del contenedor de Registro
              //Contenedor de Mantenimiento
              Container(
                margin: const EdgeInsets.only(top: 1),
                padding: const EdgeInsets.all(1),
                child: ListTile(
                  title: const Text(
                    "Mantenimiento",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  tileColor: Colors.blue[400],
                  onTap: () {
                    Navigator.pushNamed(context, ListarRegistroEquipo.ROUTE);
                  },
                ),
              ), //Fin del container de Mantenimiento
              //Container de Reporte
              Container(
                margin: const EdgeInsets.only(top: 1),
                padding: const EdgeInsets.all(1),
                child: ListTile(
                  title: const Text(
                    "Reporte",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  tileColor: Colors.blue[400],
                  onTap: () {
                    // Add navigation or functionality here
                  },
                ),
              ), //Fin del container de Reporte
              //Inicio del container de Seguimiento
              Container(
                margin: const EdgeInsets.only(top: 1),
                padding: const EdgeInsets.all(1),
                child: ListTile(
                  title: const Text(
                    "Seguimiento",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  tileColor: Colors.blue[400],
                  onTap: () {
                    // Add navigation or functionality here
                  },
                ),
              ), //Fin del container de Seguimiento
              //Inicio de container de Asignacion
              Container(
                margin: const EdgeInsets.only(top: 1),
                padding: const EdgeInsets.all(1),
                child: ListTile(
                  title: const Text(
                    "Asignación",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  tileColor: Colors.blue[400],
                  onTap: () {
                    // Add navigation or functionality here
                  },
                ),
              ),
              //Inicio de container de Sign out
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(top: 1),
                padding: const EdgeInsets.all(1),
                child: ListTile(
                  title: const Text(
                    textAlign: TextAlign.center,
                    "Sign out",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  tileColor: const Color.fromARGB(255, 180, 32, 21),
                  onTap: () {
                    Navigator.pushNamed(context, Login.ROUTE);
                  },
                ),
              )
            ],
          ),
        ),
      ),
      // drawer: Drawer(
      //   child: Container(
      //     color: Colors.white,
      //     child: Column(
      //       children: [
      //         Container(
      //           margin: const EdgeInsets.all(20),
      //           child: Image.asset("lib/assets/appbar.png"),
      //         ),
      //         const Text(
      //           "Administrador",
      //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      //         ),
      //         Container(
      //           margin: const EdgeInsets.only(top: 30),
      //           padding: const EdgeInsets.all(20),
      //           width: double.infinity,
      //           color: Colors.blue[700],
      //           alignment: Alignment.center,
      //           child: const Text(
      //             "Home",
      //             style: TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 20,
      //                 color: Colors.white),
      //           ),
      //         ),
      //         Container(
      //           margin: const EdgeInsets.only(top: 2),
      //           padding: const EdgeInsets.all(20),
      //           width: double.infinity,
      //           color: Colors.blue[400],
      //           child: const Text(
      //             "Registrar",
      //             style: TextStyle(
      //                 fontWeight: FontWeight.w400,
      //                 fontSize: 20,
      //                 color: Colors.white),
      //           ),
      //         ),
      //         Container(
      //           margin: const EdgeInsets.only(top: 2),
      //           padding: const EdgeInsets.all(20),
      //           width: double.infinity,
      //           color: Colors.blue[400],
      //           child: const Text(
      //             "Mantenimiento",
      //             style: TextStyle(
      //                 fontWeight: FontWeight.w400,
      //                 fontSize: 20,
      //                 color: Colors.white),
      //           ),
      //         ),
      //         Container(
      //           margin: const EdgeInsets.only(top: 2),
      //           padding: const EdgeInsets.all(20),
      //           width: double.infinity,
      //           color: Colors.blue[400],
      //           child: const Text(
      //             "Reporte",
      //             style: TextStyle(
      //                 fontWeight: FontWeight.w400,
      //                 fontSize: 20,
      //                 color: Colors.white),
      //           ),
      //         ),
      //         Container(
      //           margin: const EdgeInsets.only(top: 2),
      //           padding: const EdgeInsets.all(20),
      //           width: double.infinity,
      //           color: Colors.blue[400],
      //           child: const Text(
      //             "Seguimiento",
      //             style: TextStyle(
      //                 fontWeight: FontWeight.w400,
      //                 fontSize: 20,
      //                 color: Colors.white),
      //           ),
      //         ),
      //         Container(
      //           margin: const EdgeInsets.only(top: 2),
      //           padding: const EdgeInsets.all(20),
      //           width: double.infinity,
      //           color: Colors.blue[400],
      //           child: const Text(
      //             "Asignación",
      //             style: TextStyle(
      //                 fontWeight: FontWeight.w400,
      //                 fontSize: 20,
      //                 color: Colors.white),
      //           ),
      //         ),
      //         Expanded(child: Container()),
      //         Container(
      //           margin: const EdgeInsets.only(top: 2),
      //           padding: const EdgeInsets.all(20),
      //           width: double.infinity,
      //           color: const Color.fromARGB(255, 180, 32, 21),
      //           alignment: Alignment.center,
      //           child: const Text(
      //             "Sign outt",
      //             style: TextStyle(
      //                 fontWeight: FontWeight.w400,
      //                 fontSize: 20,
      //                 color: Colors.white),
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
