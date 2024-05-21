import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class RegistrarEquipo extends StatelessWidget {
  static String ROUTE = "/registrar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guardar"),
      ),
      body: Container(
        child: _FormEquipo(),
      ),
    );
  }
}

class _FormEquipo extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final logger = Logger();
  final codeControlller = TextEditingController();
  final titleControlller = TextEditingController();
  final dateControlller = TextEditingController();
  final descripcionControlller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
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
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: titleControlller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Tiene que ingresar titúlo";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: "Titulo", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: dateControlller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Tiene que ingresar fecha";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: "Fecha", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: descripcionControlller,
                maxLines: 8, //Caclula la cantidad de lineas que debe ingresar
                maxLength:
                    100, //calcula la cantidad maxima que debe ingresar en el text
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Tiene que ingresar descripción";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: "Descripción", border: OutlineInputBorder()),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      logger.i("Validar" + codeControlller.text);
                    }
                  },
                  child: const Text('Button'))
            ],
          ),
        ));
  }
}
