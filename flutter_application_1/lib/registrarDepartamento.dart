import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrarDepartamento extends StatefulWidget {
  static String ROUTE = "/registrarDepartamento";

  _RegistrarDepartamento createState() => _RegistrarDepartamento();
}

class _RegistrarDepartamento extends State<RegistrarDepartamento> {
  final _formKey = GlobalKey<FormState>();
  final _departamentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Departamento"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              controller: _departamentController,
              decoration:
                  const InputDecoration(labelText: "Nombre del Departamento"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el nombre del Departamento';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _registrarDepart();
                  }
                },
                child: const Text('Registrar'))
          ],
        )),
      ),
    );
  }

  //Conexion con la bdd
  void _registrarDepart() async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/8080/api/v1/departamentos/guardar'),
      headers: <String, String>{
        'Context-type': 'application/json; charset-UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nombre': _departamentController.text,
      }),
    );
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Departamento Registrado')),
      );
      _departamentController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al registrar el departamento')));
    }
  }

  @override
  void disponse() {
    _departamentController.dispose();
    super.dispose();
  }
}
