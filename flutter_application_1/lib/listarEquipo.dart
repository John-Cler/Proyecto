import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/registrarEquipo.dart';

class ListarRegistroEquipo extends StatefulWidget {
  static String ROUTE = "/listarRegistroEquipo";

  const ListarRegistroEquipo({super.key});

  @override
  _ListarRegistroEquipoState createState() => _ListarRegistroEquipoState();
}

class _ListarRegistroEquipoState extends State<ListarRegistroEquipo> {
  final List<Map<String, String>> _equipos = [];
  //Funcion de Guardar los registros
  void _addEquipo(Map<String, String> equipo) {
    setState(() {
      _equipos.add(equipo);
    });
  }

  //Funcion de Editar los registros
  void _editEquipo(int index, Map<String, String> equipo) {
    setState(() {
      _equipos[index] = equipo;
    });
  }

  //Funcion de eliminar los registros
  void _deleteEquipo(int index) {
    setState(() {
      _equipos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Incio de Buton flotante de nuevo registro
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.pushNamed(
            context,
            RegistrarEquipo.ROUTE,
            arguments: null,
          );
          if (result != null) {
            _addEquipo(result as Map<String, String>);
          }
        },
      ), //Fin de Butoon Flotante para agregar nuevo registro
      appBar: AppBar(
        title: const Text("Lista de equipos"),
      ),
      body: ListView.builder(
        itemCount: _equipos.length,
        itemBuilder: (context, index) {
          final equipo = _equipos[index];
          return ListTile(
            title: Text('${equipo["codigo"]} - ${equipo["tipo"]}'),
            subtitle:
                Text('Fecha: ${equipo["fecha"]}, Marca: ${equipo["marca"]}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      RegistrarEquipo.ROUTE,
                      arguments: equipo,
                    );
                    if (result != null) {
                      _editEquipo(index, result as Map<String, String>);
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _deleteEquipo(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
