import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/registrarPersona.dart';

class ListarPersona extends StatefulWidget {
  static String ROUTE = "/listarPersona";

  const ListarPersona({super.key});
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
        backgroundColor: Colors.indigo[900],
      ),
      body: ListView.builder(
        itemCount: _personas.length,
        itemBuilder: (context, index) {
          final persona = _personas[index];
          return ListTile(
            title: Text(
                '${persona["codigo"]}-${persona["nombre"]},${persona["apellidop"]}'),
            subtitle: Text('${persona["email"]}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    final btn = await Navigator.pushNamed(
                        context, RegistrarPersona.ROUTE,
                        arguments: persona);
                    if (btn != null) {
                      _editPersona(index, btn as Map<String, String>);
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _deletetPersona(index);
                  },
                )
              ],
            ),
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
      _personas[index] = persona;
    });
  }

  void _deletetPersona(int index) {
    setState(() {
      _personas.removeAt(index);
    });
  }
}
