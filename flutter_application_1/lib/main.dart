import 'package:flutter/material.dart';
import 'package:flutter_application_1/Mantenimiento/addMantenimiento.dart';
import 'package:flutter_application_1/Mantenimiento/solicitudMantenimiento.dart';
import 'package:flutter_application_1/asignarEquipo.dart';
import 'package:flutter_application_1/Mantenimiento/detalleMantenimiento.dart';
import 'package:flutter_application_1/Mantenimiento/listaMantenimiento.dart';
import 'package:flutter_application_1/listarEquipo.dart';
import 'package:flutter_application_1/listarPersona.dart';
import 'package:flutter_application_1/Login/login.dart';
import 'package:flutter_application_1/menu.dart';
import 'package:flutter_application_1/registrarBloque.dart';
import 'package:flutter_application_1/registrarDepartamento.dart';
import 'package:flutter_application_1/registrarEquipo/registrarEquipo.dart';
import 'package:flutter_application_1/registrarPersona.dart';
import 'package:flutter_application_1/reporte.dart';
import 'listadoUsuarios.dart';
import 'registrarUsuario.dart';

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
        ListarRegistroEquipo.route: (_) => const ListarRegistroEquipo(),
        ListarPersona.route: (_) => const ListarPersona(),
        ListaMantenimiento.route: (_) => const ListaMantenimiento(),
        DetalleMantenimiento.route: (_) => DetalleMantenimiento(),
        RegisterBloque.route: (_) => const RegisterBloque(),
        RegistrarDepartamento.route: (_) => RegistrarDepartamento(),
        AddMantenimiento.route: (_) =>
            AddMantenimiento(onAddRecord: (record) {}),
        SolicitudMantenimiento.route: (context) =>
            const SolicitudMantenimiento(),
        Reporte.route: (_) => Reporte(),
        RegistrarEquipo.route: (_) => const RegistrarEquipo(),
        RegistrarPersona.route: (_) => const RegistrarPersona(),
        AsignarEquipo.route: (_) => AsignarEquipo(),
        ListadoUsuarios.route: (context) => ListadoUsuarios(),
        RegistrarUsuario.route: (context) => const RegistrarUsuario(),
      },
    );
  }
}
