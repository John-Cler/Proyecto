import 'package:flutter/material.dart';
import 'package:flutter_application_1/addMantenimiento.dart';
import 'package:flutter_application_1/detalleMantenimiento.dart';

class ListaMantenimiento extends StatefulWidget {
  static String ROUTE = "/listaMantenimiento";
  @override
  _MaintenanceListScreenState createState() => _MaintenanceListScreenState();
}

class _MaintenanceListScreenState extends State<ListaMantenimiento> {
  List<MaintenanceRecord> maintenanceRecords = [];

  void _addMaintenanceRecord(MaintenanceRecord record) {
    setState(() {
      maintenanceRecords.add(record);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Mantenimientos'),
      ),
      body: ListView.builder(
        itemCount: maintenanceRecords.length,
        itemBuilder: (context, index) {
          final record = maintenanceRecords[index];
          return ListTile(
            title: Text(record.code),
            subtitle: Text(record.description),
            onTap: () {
              Navigator.pushNamed(context, DetalleMantenimiento.ROUTE);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AddMantenimiento(onAddRecord: _addMaintenanceRecord),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
