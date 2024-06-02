import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/registrarPersona.dart';

class ListarPersona extends StatefulWidget {
  static String ROUTE = "/";
  @override
  _ListarPersonaState createState() => _ListarPersonaState();
}

class _ListarPersonaState extends State<ListarPersona> {
  final List<Map<String, String>> _personas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.pushNamed(
              context, RegistrarPersona.ROUTE,
              arguments: null);
          if (result != null) {
            _addPersona(result as Map<String, String>);
          }
        },
      ),
      appBar: AppBar(
        title: const Text("Lista de personas"),
      ),
      body: ListView.builder(
        itemCount: _personas.length,
        itemBuilder: (context, index) {
          final persona = _personas[index];
          return ListTile(
            title: Text('${persona["codigo"]}'),
          );
        },
      ),
    );
  }

  void _addPersona(Map<String, String> persona) {
    setState(() {
      _personas.add(persona);
    });
  }

  void _editPersona(int index, Map<String, String> persona) {
    setState(() {
      _personas.add(persona);
    });
  }

  void _deletetPersona(int index) {
    setState(() {
      _personas.removeAt(index);
    });
  }
}
