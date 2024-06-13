import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Para manejar el formato de fecha
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistrarEquipo extends StatefulWidget {
  static String ROUTE = "/registrarEquipo";

  const RegistrarEquipo({super.key});

  @override
  _RegistrarEquipoState createState() => _RegistrarEquipoState();
}

class _RegistrarEquipoState extends State<RegistrarEquipo> {
  final _formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();
  String tipo = 'Computadora';
  final dateController = TextEditingController();
  final descripcionController = TextEditingController();
  final activoController = TextEditingController();
  final nseriController = TextEditingController();
  final marcaController = TextEditingController();
  final modeloController = TextEditingController();
  //combobox de departamentos
  List<String> departments = [];
  String? selectDepartamentos;
  //Combobox de Bloque
  List<String> bloq = [];
  String? selectBloquess;

  Map<String, String>? _currentEquipo;
  @override
  void initState() {
    super.initState();
    fetchDepartamentos();
    fetchBloques();
  }

  //ComboBox de Departamento
  Future<void> fetchDepartamentos() async {
    final url = Uri.parse('http://localhost:8080/api/v1/departamentos');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      setState(() {
        departments = data
            .map<String>((item) => item['nombre'] as String)
            .toSet()
            .toList();
        if (departments.isNotEmpty) {
          selectDepartamentos = selectDepartamentos != null &&
                  departments.contains(selectDepartamentos)
              ? selectDepartamentos
              : departments[0];
        }
      });
    } else {
      print('Failed to load departamentos');
    }
  }

  Future<void> fetchBloques() async {
    final url = Uri.parse('http://localhost:8080/api/v1/bloques');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      setState(() {
        bloq = data
            .map<String>((item) => item['nombre'] as String)
            .toSet()
            .toList();
        if (bloq.isNotEmpty) {
          selectBloquess =
              selectBloquess != null && bloq.contains(selectBloquess)
                  ? selectBloquess
                  : bloq[0];
        }
      });
    } else {
      print('Failed to load bloques');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final equipo =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    if (equipo != null) {
      _currentEquipo = equipo;
      codeController.text = equipo["codigo"]!;
      tipo = equipo["tipo"]!;
      descripcionController.text = equipo["descripcion"]!;
      activoController.text = equipo["activo"]!;
      nseriController.text = equipo["serie"]!;
      marcaController.text = equipo["marca"]!;
      modeloController.text = equipo["modelo"]!;
    }
  }

  _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _saveForm() async {
    if (_formKey.currentState!.validate()) {
      final equipo = {
        "codigo": codeController.text,
        "tipo": tipo,
        "fecha": dateController.text,
        "descripcion": descripcionController.text,
        "activo": activoController.text,
        "serie": nseriController.text,
        "marca": marcaController.text,
        "modelo": modeloController.text,
      };

      String url = 'http://localhost:8080/api/v1/equipos/';
      bool isUpdating = _currentEquipo != null;
      final response;

      if (isUpdating) {
        url += 'actualizar/${_currentEquipo!['id']}';
        response = await http.post(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'codigo': codeController.text,
            'tipo': tipo,
            'id_departamento': departments.indexOf(
                selectDepartamentos!), // Reemplaza con el ID del departamento adecuado
            'id_bloque': bloq.indexOf(
                selectBloquess!), // Reemplaza con el ID del bloque adecuado
            'descripcion': descripcionController.text,
            'nro_activo': activoController.text,
            'nro_serie': nseriController.text,
            'marca': marcaController.text,
            'modelo': modeloController.text,
            'estado': 'Activo', // Reemplaza con el estado adecuado
          }),
        );
      } else {
        url += 'guardar';
        response = await http.post(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'codigo': codeController.text,
            'tipo': tipo,
            'id_departamento': departments.indexOf(selectDepartamentos!) +
                1, // Reemplaza con el ID del departamento adecuado
            'id_bloque': bloq.indexOf(selectBloquess!) +
                1, // Reemplaza con el ID del bloque adecuado
            'descripcion': descripcionController.text,
            'nro_activo': activoController.text,
            'nro_serie': nseriController.text,
            'marca': marcaController.text,
            'modelo': modeloController.text,
            'estado': 'Activo', // Reemplaza con el estado adecuado
          }),
        );
      }

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(isUpdating
                  ? 'Equipo actualizado con éxito'
                  : 'Equipo registrado con éxito')),
        );
        Navigator.pop(context, equipo);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Error al ${isUpdating ? 'actualizar' : 'registrar'} el equipo')),
        );
      }
    }
  }

  Future<void> _deleteEquipo(int id) async {
    final response = await http.delete(
      Uri.parse('http://localhost:8080/api/v1/equipos/eliminar/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Equipo eliminado con éxito')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar el equipo')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Equipo"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 15),
                TextFormField(
                  controller: codeController,
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
                DropdownButtonFormField<String>(
                  value: tipo,
                  items: ['Computadora', 'Scanner', 'Impresora', 'Otros']
                      .map((label) => DropdownMenuItem(
                            child: Text(label),
                            value: label,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      tipo = value!;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: "Tipo de equipo",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                if (departments.isNotEmpty)
                  DropdownButtonFormField<String>(
                    value: selectDepartamentos,
                    items: departments
                        .map((dept) => DropdownMenuItem(
                              child: Text(dept),
                              value: dept,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectDepartamentos = value!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Departamento",
                      border: OutlineInputBorder(),
                    ),
                  ),
                const SizedBox(height: 15),
                if (bloq.isNotEmpty)
                  DropdownButtonFormField<String>(
                    value: selectBloquess,
                    items: bloq
                        .map((bloque) => DropdownMenuItem(
                              child: Text(bloque),
                              value: bloque,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectBloquess = value!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Bloque",
                      border: OutlineInputBorder(),
                    ),
                  ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: dateController,
                  readOnly: true,
                  onTap: _pickDate,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tiene que ingresar fecha";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Fecha",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: descripcionController,
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
                  controller: activoController,
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
                  controller: nseriController,
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
                  controller: marcaController,
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
                  controller: modeloController,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _saveForm,
                        child: const Text('Guardar'),
                      ),
                      if (_currentEquipo != null)
                        ElevatedButton(
                          onPressed: () {
                            _deleteEquipo(int.parse(_currentEquipo!['id']!));
                          },
                          child: const Text('Eliminar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    codeController.dispose();
    dateController.dispose();
    descripcionController.dispose();
    activoController.dispose();
    nseriController.dispose();
    marcaController.dispose();
    modeloController.dispose();
    super.dispose();
  }
}



// class RegistrarEquipo extends StatefulWidget {
//   static String ROUTE = "/registrarEquipo";

//   const RegistrarEquipo({super.key});

//   @override
//   _RegistrarEquipoState createState() => _RegistrarEquipoState();
// }

// class _RegistrarEquipoState extends State<RegistrarEquipo> {
//   final _formKey = GlobalKey<FormState>();
//   final logger = Logger();
//   final codeController = TextEditingController();
//   String tipo = 'Computadora';
//   final dateController = TextEditingController();
//   final descripcionController = TextEditingController();
//   final activoController = TextEditingController();
//   final nseriController = TextEditingController();
//   final marcaController = TextEditingController();
//   final modeloController = TextEditingController();

//   Map<String, String>? _currentEquipo;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final equipo =
//         ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
//     if (equipo != null) {
//       _currentEquipo = equipo;
//       codeController.text = equipo["codigo"]!;
//       tipo = equipo["tipo"]!;
//       dateController.text = equipo["fecha"]!;
//       descripcionController.text = equipo["descripcion"]!;
//       activoController.text = equipo["activo"]!;
//       nseriController.text = equipo["serie"]!;
//       marcaController.text = equipo["marca"]!;
//       modeloController.text = equipo["modelo"]!;
//     }
//   }

//   _pickDate() async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (picked != null) {
//       setState(() {
//         dateController.text = DateFormat('yyyy-MM-dd').format(picked);
//       });
//     }
//   }

//   _saveForm() {
//     if (_formKey.currentState!.validate()) {
//       final equipo = {
//         "codigo": codeController.text,
//         "tipo": tipo,
//         "fecha": dateController.text,
//         "descripcion": descripcionController.text,
//         "activo": activoController.text,
//         "serie": nseriController.text,
//         "marca": marcaController.text,
//         "modelo": modeloController.text,
//       };

//       Navigator.pop(context, equipo);

//       logger.i("Equipo registrado: $equipo");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Registrar Equipo"),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(15),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 const SizedBox(height: 15),
//                 TextFormField(
//                   controller: codeController,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Tiene que ingresar codigo";
//                     }
//                     return null;
//                   },
//                   decoration: const InputDecoration(
//                     labelText: "Codigo de equipo",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 DropdownButtonFormField<String>(
//                   value: tipo,
//                   items: ['Computadora', 'Scanner', 'Impresora', 'Otros']
//                       .map((label) => DropdownMenuItem(
//                             child: Text(label),
//                             value: label,
//                           ))
//                       .toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       tipo = value!;
//                     });
//                   },
//                   decoration: const InputDecoration(
//                     labelText: "Tipo de equipo",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 TextFormField(
//                   controller: dateController,
//                   readOnly: true,
//                   onTap: _pickDate,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Tiene que ingresar fecha";
//                     }
//                     return null;
//                   },
//                   decoration: const InputDecoration(
//                     labelText: "Fecha",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 TextFormField(
//                   controller: descripcionController,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Tiene que ingresar descripción";
//                     }
//                     return null;
//                   },
//                   decoration: const InputDecoration(
//                     labelText: "Descripción",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 TextFormField(
//                   controller: activoController,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Ingresar el Número de activo";
//                     }
//                     return null;
//                   },
//                   decoration: const InputDecoration(
//                     labelText: "Nro Activo",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 TextFormField(
//                   controller: nseriController,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Ingresar número de serie";
//                     }
//                     return null;
//                   },
//                   decoration: const InputDecoration(
//                     labelText: "Nro de serie",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 TextFormField(
//                   controller: marcaController,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Ingresar marca del equipo";
//                     }
//                     return null;
//                   },
//                   decoration: const InputDecoration(
//                     labelText: "Marca de equipo",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 TextFormField(
//                   controller: modeloController,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Ingresar modelo de equipo";
//                     }
//                     return null;
//                   },
//                   decoration: const InputDecoration(
//                     labelText: "Modelo de equipo",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: _saveForm,
//                     child: const Text('Guardar'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // @override
//   // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//   //   super.debugFillProperties(properties);
//   //   properties.add(DiagnosticsProperty<Map<String, String>?>(
//   //       '_currentEquipo', _currentEquipo));
//   // }
// }
