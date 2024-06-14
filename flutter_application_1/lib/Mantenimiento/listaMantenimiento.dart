import 'package:flutter/material.dart';

import 'addMantenimiento.dart';
import 'solicitudMantenimiento.dart';

class Mantenimiento {
  final String codigo;
  final String estado;
  final String fecha;
  final String motivo;
  final String equipo;
  final String usuario;

  Mantenimiento({
    required this.codigo,
    required this.estado,
    required this.fecha,
    required this.motivo,
    required this.equipo,
    required this.usuario,
  });
}

class ListaMantenimiento extends StatefulWidget {
  static String route = "/listaMantenimiento";
  const ListaMantenimiento({super.key});

  @override
  State<ListaMantenimiento> createState() => _ListaMantenimientoState();
}

class _ListaMantenimientoState extends State<ListaMantenimiento> {
  List<Mantenimiento> maintenanceRecords = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Mantenimientos'),
      ),
      body: maintenanceRecords.isEmpty
          ? const Center(
              child: Text(
                'No hay registros de mantenimiento.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: maintenanceRecords.length,
              itemBuilder: (context, index) {
                final record = maintenanceRecords[index];
                return ListTile(
                  title: Text(record.codigo),
                  subtitle: Text(record.motivo),
                  onTap: () {
                    // Implementar la navegación al detalle del mantenimiento
                  },
                );
              },
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushNamed(context, AddMantenimiento.route);
            },
            icon: const Icon(Icons.add),
            label: const Text('Agregar Mantenimiento'),
          ),
          const SizedBox(height: 16),
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushNamed(context, SolicitudMantenimiento.route);
            },
            icon: const Icon(Icons.assignment),
            label: const Text('Asignar Mantenimiento'),
          ),
        ],
      ),
    );
  }
}
