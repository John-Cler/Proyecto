import 'package:flutter/material.dart';
import 'package:flutter_application_1/listarEquipo.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/menu.dart';
import 'package:flutter_application_1/registrarEquipo.dart';

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
        Login.ROUTE: (_) => Login(),
        Menu.ROUTE: (_) => Menu(),
        ListarRegistroEquipo.ROUTE: (_) => ListarRegistroEquipo(),
        RegistrarEquipo.ROUTE: (_) => RegistrarEquipo(),
      },
    );
  }
}
