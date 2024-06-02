import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart';

class RegistrarPersona extends StatefulWidget {
  static String ROUTE = "/registrarPersona";

  const RegistrarPersona({super.key});

  @override
  _FormPersona createState() => _FormPersona();
}

class _FormPersona extends State<RegistrarPersona> {
  final _formKey = GlobalKey<FormState>();
  final logger = Logger();
  final codeController = TextEditingController();
  final nombreController = TextEditingController();
  final apellidomController = TextEditingController();
  final apellidopController = TextEditingController();
  final emailController = TextEditingController();
  final celController = TextEditingController();
  final fechaController = TextEditingController();

  Map<String, String>? _currentPersona;
  @override

  //funcion de Calendario
  void didChangeDependencies() {
    super.didChangeDependencies();
    final persona =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    if (persona != null) {
      _currentPersona = persona;
      codeController.text = persona["codigo"]!;
      nombreController.text = persona["nombre"]!;
      apellidopController.text = persona["apellidop"]!;
      apellidomController.text = persona["apellidom"]!;
      emailController.text = persona["email"]!;
      celController.text = persona["celular"]!;
      fechaController.text = persona["fecha"]!;
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
        fechaController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  _saveForm() {
    if (_formKey.currentState!.validate()) {
      final persona = {
        "codigo": codeController.text,
        "nombre": nombreController.text,
        "apellidop": apellidopController.text,
        "apellidom": apellidomController.text,
        "email": emailController.text,
        "celular": celController.text,
        "fecha": fechaController.text,
      };
      Navigator.pop(context, persona);
      logger.i("Persona registrada: $persona");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Persona"),
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
                    labelText: "Codigo de persona",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: nombreController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tiene que ingresar nombre";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Nombre",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: apellidopController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tiene que ingresar apellido";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Apellido paterno",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: apellidomController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tiene que ingresar apellido";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Apellido materno",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: emailController,
                  // maxLines: 8, // Define la cantidad de lineas que debe ingresar
                  // maxLength:
                  //     100, // Calcula la cantidad máxima que debe ingresar en el texto
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tiene que ingresar correo";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Correo electronico",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: celController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Ingresar numero de telefono";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Telefono",
                    border: OutlineInputBorder(),
                  ),
                ),
                // const SizedBox(height: 15),
                // TextFormField(
                //   controller: celController,
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return "Ingresar número de telefono";
                //     }
                //     return null;
                //   },
                //   // decoration: const InputDecoration(
                //   //   labelText: "Telefono",
                //   //   border: OutlineInputBorder(),
                //   // ),
                // ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: fechaController,
                  readOnly: true,
                  onTap: _pickDate,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tiene que ingresar fecha";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Fecha de nacimiento",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: ElevatedButton(
                    onPressed: _saveForm,
                    child: const Text('Registrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
