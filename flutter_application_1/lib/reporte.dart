import 'package:flutter/material.dart';
import 'package:flutter_application_1/addMantenimiento.dart';

class Reporte extends StatefulWidget {
  static String ROUTE = "/reporte";
  @override
  _ReporteScreenState createState() => _ReporteScreenState();
}

enum ReportType {
  inUse,
  underMaintenance,
  decommissioned,
  pending,
  completed,
}

extension ReportTypeExtension on ReportType {
  String get displayName {
    switch (this) {
      case ReportType.inUse:
        return 'Dispositivos en uso';
      case ReportType.underMaintenance:
        return 'Dispositivos en mantenimiento';
      case ReportType.decommissioned:
        return 'Dispositivos dados de baja';
      case ReportType.pending:
        return 'Dispositivos pendientes';
      case ReportType.completed:
        return 'Dispositivos realizados';
      default:
        return '';
    }
  }
}

class _ReporteScreenState extends State<Reporte> {
  ReportType? _selectedReportType;
  List<MaintenanceRecord> _filteredRecords = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reportes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<ReportType>(
              decoration: InputDecoration(labelText: 'Seleccionar reporte'),
              items: ReportType.values.map((ReportType type) {
                return DropdownMenuItem<ReportType>(
                  value: type,
                  child: Text(type.displayName),
                );
              }).toList(),
              onChanged: (ReportType? newValue) {
                setState(() {
                  _selectedReportType = newValue;
                  _filterRecords();
                });
              },
              value: _selectedReportType,
              validator: (value) {
                if (value == null) {
                  return 'Por favor seleccione un tipo de reporte';
                }
                return null;
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredRecords.length,
                itemBuilder: (context, index) {
                  final record = _filteredRecords[index];
                  return ListTile(
                    title: Text(record.code),
                    subtitle: Text(record.description),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _filterRecords() {
    _filteredRecords = [];

    // Aquí asumimos que tienes acceso a la lista completa de registros de mantenimiento
    List<MaintenanceRecord> allRecords = [
      MaintenanceRecord(
        code: '001',
        technician: 'Technician A',
        description: 'Fix screen',
        observations: 'None',
        status: 'completed',
        date: '2023-01-01',
      ),
      // Agrega más registros aquí...
    ];

    switch (_selectedReportType) {
      case ReportType.inUse:
        _filteredRecords =
            allRecords.where((record) => record.status == 'in_use').toList();
        break;
      case ReportType.underMaintenance:
        _filteredRecords = allRecords
            .where((record) => record.status == 'under_maintenance')
            .toList();
        break;
      case ReportType.decommissioned:
        _filteredRecords = allRecords
            .where((record) => record.status == 'decommissioned')
            .toList();
        break;
      case ReportType.pending:
        _filteredRecords =
            allRecords.where((record) => record.status == 'pending').toList();
        break;
      case ReportType.completed:
        _filteredRecords =
            allRecords.where((record) => record.status == 'completed').toList();
        break;
      default:
        _filteredRecords = [];
    }
  }
}
