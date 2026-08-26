import 'package:flutter/material.dart';
import 'package:maplibre/maplibre.dart';

import 'package:flutter_application_1/features/tracking/presentation/widgets/flutter_map.dart';
import 'package:flutter_application_1/features/tracking/presentation/widgets/route_status_card.dart';
import 'package:flutter_application_1/features/tracking/presentation/widgets/boton_localizacion.dart';

import 'package:flutter_application_1/features/tracking/domain/entities/paradas_bus.dart';
import 'package:flutter_application_1/features/tracking/domain/entities/puntos_ruta.dart';
import 'package:flutter_application_1/features/tracking/data/servicios/servicio_ruta.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  MapController? mapController;

  final RoutingService routingService = RoutingService();

  List<RoutePoint> routePoints = [];

  final List<RouteStop> stops = [
    RouteStop(
      id: '1',
      name: 'Parada 1',
      latitude: 4.422877080625936,
      longitude: -75.18679922416784,
      order: 1,
    ),
    RouteStop(
      id: '2',
      name: 'Parada 2',
      latitude: 4.446144133087039,
      longitude: -75.23887333963172,
      order: 2,
    ),
    RouteStop(
      id: '3',
      name: 'Colegio',
      latitude: 4.445888559145701,
      longitude: -75.22936525875085,
      order: 3,
    ),
  ];

  @override
  void initState() {
    super.initState();

    cargarRuta();
  }

  Future<void> cargarRuta() async {
    try {
      debugPrint('Solicitando ruta...');

      final ruta = await routingService.obtenerRuta(stops);

      debugPrint('Ruta recibida correctamente: ${ruta.length} puntos');

      if (!mounted) {
        return;
      }

      setState(() {
        routePoints = ruta;
      });
    } catch (e) {
      debugPrint('ERROR RUTA: $e');
    }
  }

  void centrarMapa() {
    final controller = mapController;

    if (controller == null) {
      return;
    }

    controller.animateCamera(center: Position(-75.2322, 4.4389), zoom: 16);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tracking')),
      body: Stack(
        children: [
          TrackingMap(
            routePoints: routePoints,
            onMapCreated: (controller) {
              mapController = controller;
            },
          ),
          const Positioned(
            left: 20,
            right: 20,
            bottom: 30,
            child: RouteStatusCard(),
          ),

          Positioned(
            right: 20,
            bottom: 220,
            child: LocationButton(onPressed: centrarMapa),
          ),
        ],
      ),
    );
  }
}
