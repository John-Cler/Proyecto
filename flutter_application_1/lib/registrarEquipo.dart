import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: Form(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 15),
              TextFormField(
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Tiene que ingresar descripción";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: "Descripción", border: OutlineInputBorder()),
              )
            ],
          ),
        ));
  }
}
