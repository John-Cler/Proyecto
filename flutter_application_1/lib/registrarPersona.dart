import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class RegistrarPersona extends StatelessWidget {
  static String ROUTE = "/registrarPersona";

  const RegistrarPersona({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Persona"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: _FormPersona(),
        ),
      ),
    );
  }
}

class _FormPersona extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final logger = Logger();
  final codeController = TextEditingController();
  final nombreController = TextEditingController();
  final apellidomController = TextEditingController();
  final apellidopController = TextEditingController();
  final emailController = TextEditingController();
  final celController = TextEditingController();
  final fechaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 15),
          TextFormField(
            controller: codeController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Tiene que ingresar codigo";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Codigo de persona",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: nombreController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Tiene que ingresar nombre";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Nombre",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: apellidopController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Tiene que ingresar apellido";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Apellido paterno",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: apellidopController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Tiene que ingresar apellido";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Apellido materno",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: apellidomController,
            // maxLines: 8, // Define la cantidad de lineas que debe ingresar
            // maxLength:
            //     100, // Calcula la cantidad máxima que debe ingresar en el texto
            validator: (value) {
              if (value!.isEmpty) {
                return "Tiene que ingresar correo";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Correo electronico",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Ingresar numero de telefono";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Telefono",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: celController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Ingresar número de telefono";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Telefono",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: fechaController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Ingresar fecha de nacimiento";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Fecha de nacimiento",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  logger.i("Validar: ${codeController.text}");
                  logger.i("Validar: ${nombreController.text}");
                  // Se pueden agregar más validaciones aquí si es necesario
                }
              },
              child: const Text('Button'),
            ),
          ),
        ],
      ),
    );
  }
}
