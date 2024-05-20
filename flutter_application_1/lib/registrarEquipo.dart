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
    return Form(child: Text(""));
  }
}
