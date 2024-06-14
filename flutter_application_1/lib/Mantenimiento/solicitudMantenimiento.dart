import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SolicitudMantenimiento extends StatefulWidget {
  static String route = "/solicitudMantenimiento";
  const SolicitudMantenimiento({super.key});

  @override
  State<SolicitudMantenimiento> createState() => _SolicitudMantenimientoState();
}

class _SolicitudMantenimientoState extends State<SolicitudMantenimiento> {
  final _formKey = GlobalKey<FormState>();
  final _codigoController = TextEditingController();
  final _fechaController = TextEditingController();
  final _motivoController = TextEditingController();
  String _estado = 'Activo';
  String? _equipo;
  String? _usuario;

  final List<String> _estados = ['Activo', 'Inactivo'];
  final List<String> _equipos = [
    'Equipo 1',
    'Equipo 2',
    'Equipo 3'
  ]; // Simulated data
  final List<String> _usuarios = [
    'Usuario 1',
    'Usuario 2',
    'Usuario 3'
  ]; // Simulated data

  @override
  void initState() {
    super.initState();
    _generateCodigo();
  }

  void _generateCodigo() {
    setState(() {
      _codigoController.text = 'COD-${DateTime.now().millisecondsSinceEpoch}';
    });
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
        _fechaController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _saveForm() async {
    if (_formKey.currentState!.validate()) {
      final solicitud = {
        "codigo": _codigoController.text,
        "estado": _estado,
        "fecha": _fechaController.text,
        "motivo": _motivoController.text,
        "equipo": _equipo,
        "usuario": _usuario,
      };

      print(solicitud); // Replace with actual API call

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Solicitud de mantenimiento guardada con éxito')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Solicitud de Mantenimiento"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _codigoController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "Código",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _estado,
                items: _estados.map((String estado) {
                  return DropdownMenuItem<String>(
                    value: estado,
                    child: Text(estado),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _estado = value!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Estado",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _fechaController,
                readOnly: true,
                onTap: _pickDate,
                decoration: const InputDecoration(
                  labelText: "Fecha",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _motivoController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: "Motivo",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _equipo,
                items: _equipos.map((String equipo) {
                  return DropdownMenuItem<String>(
                    value: equipo,
                    child: Text(equipo),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _equipo = value!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Equipo",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _usuario,
                items: _usuarios.map((String usuario) {
                  return DropdownMenuItem<String>(
                    value: usuario,
                    child: Text(usuario),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _usuario = value!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Usuario",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
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
    );
  }
}
