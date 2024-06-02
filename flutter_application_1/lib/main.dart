import 'package:flutter/material.dart';
import 'package:flutter_application_1/listarEquipo.dart';
import 'package:flutter_application_1/listarPersona.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/menu.dart';
import 'package:flutter_application_1/registrarEquipo.dart';
import 'package:flutter_application_1/registrarPersona.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Login.ROUTE,
      //Definir rutas de todas las paginas que se utilizaran
      routes: {
        Login.ROUTE: (_) => const Login(),
        Menu.ROUTE: (_) => const Menu(),
        ListarRegistroEquipo.ROUTE: (_) => ListarRegistroEquipo(),
        ListarPersona.ROUTE: (_) => ListarPersona(),
        RegistrarEquipo.ROUTE: (_) => RegistrarEquipo(),
        RegistrarPersona.ROUTE: (_) => const RegistrarPersona(),
      },
    );
  }
}
