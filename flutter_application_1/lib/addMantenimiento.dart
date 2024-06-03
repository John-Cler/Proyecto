import 'dart:html';

import 'package:flutter/material.dart';

class MaintenanceRecord {
  final String code;
  final String technician;
  final String description;
  final String observations;
  final String status;
  final String date;

  MaintenanceRecord({
    required this.code,
    required this.technician,
    required this.description,
    required this.observations,
    required this.status,
    required this.date,
  });
}

class AddMantenimiento extends StatefulWidget {
  static const String ROUTE = "/addMantenimiento";
  final Function(MaintenanceRecord) onAddRecord;

  const AddMantenimiento({Key? key, required this.onAddRecord})
      : super(key: key);

  @override
  _AddEditMaintenanceScreenState createState() =>
      _AddEditMaintenanceScreenState();
}

class _AddEditMaintenanceScreenState extends State<AddMantenimiento> {
  final _formKey = GlobalKey<FormState>();

  final _codeController = TextEditingController();
  String? _selectedTechnician;
  final _descriptionController = TextEditingController();
  final _observationsController = TextEditingController();
  final _statusController = TextEditingController();
  DateTime? _selectedDate;

  final List<String> _technicians = [
    'Technician A',
    'Technician B',
    'Technician C'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Mantenimiento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _codeController,
                  decoration: const InputDecoration(labelText: 'Code'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the code';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _selectedTechnician,
                  decoration:
                      const InputDecoration(labelText: 'Asignar tecnico'),
                  items: _technicians.map((String technician) {
                    return DropdownMenuItem<String>(
                      value: technician,
                      child: Text(technician),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedTechnician = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor seleccione un tecnico';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Descripcion'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese descripcion';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _observationsController,
                  decoration: const InputDecoration(labelText: 'Observacion'),
                ),
                TextFormField(
                  controller: _statusController,
                  decoration: const InputDecoration(labelText: 'Estado'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el estado del equipo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  _selectedDate == null
                      ? 'Fecha no asignada'
                      : 'Fecha: ${_selectedDate!.toLocal()}'.split(' ')[0],
                ),
                ElevatedButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null && pickedDate != _selectedDate) {
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    }
                  },
                  child: const Text('Seleccionar fecha'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _saveMaintenanceRecord();
                    }
                  },
                  child: const Text('Guardar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveMaintenanceRecord() {
    final code = _codeController.text;
    final technician = _selectedTechnician ?? '';
    final description = _descriptionController.text;
    final observations = _observationsController.text;
    final status = _statusController.text;
    final date = _selectedDate?.toLocal().toString().split(' ')[0] ?? '';

    final newRecord = MaintenanceRecord(
      code: code,
      technician: technician,
      description: description,
      observations: observations,
      status: status,
      date: date,
    );

    widget.onAddRecord(newRecord);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registro de mantenimiento guardado')),
    );

    _formKey.currentState?.reset();
    setState(() {
      _selectedTechnician = null;
      _selectedDate = null;
    });
  }

  @override
  void dispose() {
    _codeController.dispose();
    _descriptionController.dispose();
    _observationsController.dispose();
    _statusController.dispose();
    super.dispose();
  }
}
