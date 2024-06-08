import 'package:flutter/material.dart';
import 'package:flutter_application_1/addMantenimiento.dart';
import 'package:flutter_application_1/asignarEquipo.dart';
import 'package:flutter_application_1/detalleMantenimiento.dart';
import 'package:flutter_application_1/listaMantenimiento.dart';
import 'package:flutter_application_1/listarEquipo.dart';
import 'package:flutter_application_1/listarPersona.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/menu.dart';
import 'package:flutter_application_1/registrarBloque.dart';
import 'package:flutter_application_1/registrarDepartamento.dart';
import 'package:flutter_application_1/registrarEquipo.dart';
import 'package:flutter_application_1/registrarPersona.dart';
import 'package:flutter_application_1/reporte.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Login.ROUTE,
      //Definir rutas de todas las paginas que se utilizaran
      routes: {
        Login.ROUTE: (_) => const Login(),
        Menu.ROUTE: (_) => const Menu(),
        ListarRegistroEquipo.ROUTE: (_) => const ListarRegistroEquipo(),
        ListarPersona.ROUTE: (_) => const ListarPersona(),
        ListaMantenimiento.ROUTE: (_) => ListaMantenimiento(),
        DetalleMantenimiento.ROUTE: (_) => DetalleMantenimiento(),
        RegisterBloque.ROUTE: (_) => const RegisterBloque(),
        RegistrarDepartamento.ROUTE: (_) => RegistrarDepartamento(),
        AddMantenimiento.ROUTE: (_) => AddMantenimiento(
              onAddRecord: (MaintenanceRecord) {},
            ),
        Reporte.ROUTE: (_) => Reporte(),
        RegistrarEquipo.ROUTE: (_) => const RegistrarEquipo(),
        RegistrarPersona.ROUTE: (_) => const RegistrarPersona(),
        AsignarEquipo.ROUTE: (_) => AsignarEquipo(),
      },
    );
  }
}
