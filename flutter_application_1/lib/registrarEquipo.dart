import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class RegistrarEquipo extends StatelessWidget {
  static String ROUTE = "/registrarEquipo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Equipo"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: _FormEquipo(),
        ),
      ),
    );
  }
}

class _FormEquipo extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final logger = Logger();
  final codeControlller = TextEditingController();
  final tipoControlller = TextEditingController();
  final dateControlller = TextEditingController();
  final descripcionControlller = TextEditingController();
  final activoControlller = TextEditingController();
  final nseriControlller = TextEditingController();
  final marcaControlller = TextEditingController();
  final modeloControlller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 15),
          TextFormField(
            controller: codeControlller,
            validator: (value) {
              if (value!.isEmpty) {
                return "Tiene que ingresar codigo";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Codigo de equipo",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: tipoControlller,
            validator: (value) {
              if (value!.isEmpty) {
                return "Tiene que ingresar tipo";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Tipo",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: dateControlller,
            validator: (value) {
              if (value!.isEmpty) {
                return "Tiene que ingresar departamento";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Departamento",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: descripcionControlller,
            maxLines: 8, // Define la cantidad de lineas que debe ingresar
            maxLength:
                100, // Calcula la cantidad máxima que debe ingresar en el texto
            validator: (value) {
              if (value!.isEmpty) {
                return "Tiene que ingresar descripción";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Descripción",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: activoControlller,
            validator: (value) {
              if (value!.isEmpty) {
                return "Ingresar el Número de activo";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Nro Activo",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: nseriControlller,
            validator: (value) {
              if (value!.isEmpty) {
                return "Ingresar número de serie";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Nro de serie",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: marcaControlller,
            validator: (value) {
              if (value!.isEmpty) {
                return "Ingresar marca del equipo";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Marca de equipo",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: modeloControlller,
            validator: (value) {
              if (value!.isEmpty) {
                return "Ingresar modelo de equipo";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Modelo de equipo",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  logger.i("Validar: ${codeControlller.text}");
                  logger.i("Validar: ${tipoControlller.text}");
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
