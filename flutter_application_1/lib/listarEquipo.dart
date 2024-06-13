import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/registrarEquipo/registrarEquipo.dart';

class ListarRegistroEquipo extends StatefulWidget {
  static String ROUTE = "/listarRegistroEquipo";

  const ListarRegistroEquipo({super.key});

  @override
  _ListarRegistroEquipoState createState() => _ListarRegistroEquipoState();
}

class _ListarRegistroEquipoState extends State<ListarRegistroEquipo> {
  List<Map<String, dynamic>> _equipos = [];

  @override
  void initState() {
    super.initState();
    _listEquipos();
  }

  Future<void> _listEquipos() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/api/v1/equipos'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['data'] != null) {
        final List<dynamic> data = responseData['data'];
        setState(() {
          _equipos = data.map((e) => Map<String, dynamic>.from(e)).toList();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('No se encontraron equipos en la respuesta'),
          backgroundColor: Colors.red,
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error no se puede mostrar el registro'),
        backgroundColor: Colors.red,
      ));
    }
  }

  //Funcion de Guardar los registros
  void _addEquipo(Map<String, dynamic> equipo) {
    setState(() {
      _equipos.add(equipo);
    });
  }

  //Funcion de Editar los registros
  void _editEquipo(int index, Map<String, dynamic> equipo) {
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
            _addEquipo(result as Map<String, dynamic>);
          }
        },
      ), //Fin de Butoon Flotante para agregar nuevo registro
      appBar: AppBar(
        title: const Text("Lista de equipos"),
      ),
      body: _equipos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _equipos.length,
              itemBuilder: (context, index) {
                final equipo = _equipos[index];
                return ListTile(
                  title: Text('${equipo["codigo"]} - ${equipo["tipo"]}'),
                  subtitle: Text(
                      'Fecha: ${equipo["fecha"]}, Marca: ${equipo["marca"]}'),
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
                            _editEquipo(index, result as Map<String, dynamic>);
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
