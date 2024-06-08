import 'package:flutter/material.dart';

class AsignarEquipo extends StatefulWidget {
  static String ROUTE = "/asignarequipo";
  @override
  _AssignEquipmentScreenState createState() => _AssignEquipmentScreenState();
}

class _AssignEquipmentScreenState extends State<AsignarEquipo> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedEquipmentCode;
  String? _selectedUserCode;
  String? _selectedBlock;
  String? _selectedDepartment;
  DateTime? _selectedDate;

  final List<String> _equipmentCodes = [
    'E001',
    'E002',
    'E003'
  ]; // Replace with your dynamic data
  final List<String> _userCodes = [
    'U001',
    'U002',
    'U003'
  ]; // Replace with your dynamic data
  final List<String> _blocks = [
    'Block A',
    'Block B',
    'Block C'
  ]; // Replace with your dynamic data
  final List<String> _departments = [
    'Dept A',
    'Dept B',
    'Dept C'
  ]; // Replace with your dynamic data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asignación de Equipo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Código de Equipo'),
                  items: _equipmentCodes.map((String code) {
                    return DropdownMenuItem<String>(
                      value: code,
                      child: Text(code),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedEquipmentCode = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor seleccione un código de equipo';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Código de Usuario'),
                  items: _userCodes.map((String code) {
                    return DropdownMenuItem<String>(
                      value: code,
                      child: Text(code),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedUserCode = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor seleccione un código de usuario';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Bloque'),
                  items: _blocks.map((String block) {
                    return DropdownMenuItem<String>(
                      value: block,
                      child: Text(block),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedBlock = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor seleccione un bloque';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Departamento'),
                  items: _departments.map((String department) {
                    return DropdownMenuItem<String>(
                      value: department,
                      child: Text(department),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedDepartment = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor seleccione un departamento';
                    }
                    return null;
                  },
                ),
                ListTile(
                  title: Text(
                    _selectedDate == null
                        ? 'Fecha no asignada'
                        : 'Fecha: ${_selectedDate!.toLocal()}'.split(' ')[0],
                  ),
                  trailing: Icon(Icons.calendar_today),
                  onTap: _pickDate,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle form submission
                    }
                  },
                  child: Text('Asignar Equipo'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _pickDate() async {
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
  }
}
