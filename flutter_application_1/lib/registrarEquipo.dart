import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart'; // Para manejar el formato de fecha

class RegistrarEquipo extends StatefulWidget {
  static String ROUTE = "/registrarEquipo";

  const RegistrarEquipo({super.key});

  @override
  _RegistrarEquipoState createState() => _RegistrarEquipoState();
}

class _RegistrarEquipoState extends State<RegistrarEquipo> {
  final _formKey = GlobalKey<FormState>();
  final logger = Logger();
  final codeController = TextEditingController();
  String tipo = 'Computadora';
  final dateController = TextEditingController();
  final descripcionController = TextEditingController();
  final activoController = TextEditingController();
  final nseriController = TextEditingController();
  final marcaController = TextEditingController();
  final modeloController = TextEditingController();

  Map<String, String>? _currentEquipo;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final equipo =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    if (equipo != null) {
      _currentEquipo = equipo;
      codeController.text = equipo["codigo"]!;
      tipo = equipo["tipo"]!;
      dateController.text = equipo["fecha"]!;
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

  _saveForm() {
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

      Navigator.pop(context, equipo);

      logger.i("Equipo registrado: $equipo");
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
                  child: ElevatedButton(
                    onPressed: _saveForm,
                    child: const Text('Guardar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(DiagnosticsProperty<Map<String, String>?>(
  //       '_currentEquipo', _currentEquipo));
  // }
}
