import 'package:flutter/material.dart';

class RegistrarEquipo extends StatelessWidget {
  static const String ROUTE = "/registrar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guardar"),
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
    return Form(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 15),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Codigo de equipo", border: OutlineInputBorder()),
          ),
          const SizedBox(height: 15),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Titulo", border: OutlineInputBorder()),
          ),
          const SizedBox(height: 15),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Fecha", border: OutlineInputBorder()),
          ),
          const SizedBox(height: 15),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Descripción", border: OutlineInputBorder()),
          )
        ],
      ),
    );
  }
}
