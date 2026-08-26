import 'dart:async';
import 'dart:math' as math;

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

  RoutePoint? busPosition;
  int busPointIndex = 0;
  Timer? busTimer;
  final Set<String> paradasAlertadas = {};
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
  double calcularDistanciaMetros(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double radioTierra = 6371000;

    final dLat = (lat2 - lat1) * math.pi / 180;
    final dLon = (lon2 - lon1) * math.pi / 180;

    final a =
        math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(lat1 * math.pi / 180) *
            math.cos(lat2 * math.pi / 180) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return radioTierra * c;
  }

  void verificarProximidadParadas() {
    final posicion = busPosition;

    if (posicion == null) {
      return;
    }

    for (final stop in stops) {
      final distancia = calcularDistanciaMetros(
        posicion.latitude,
        posicion.longitude,
        stop.latitude,
        stop.longitude,
      );

      if (distancia <= 100 && !paradasAlertadas.contains(stop.id)) {
        paradasAlertadas.add(stop.id);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              stop.name == 'Colegio'
                  ? 'El bus está llegando al colegio'
                  : 'El bus está llegando a ${stop.name}',
            ),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

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

        if (ruta.isNotEmpty) {
          busPointIndex = 0;
          busPosition = ruta.first;
        }
      });

      iniciarSimulacion();
    } catch (e) {
      debugPrint('ERROR RUTA: $e');
    }
  }

  RoutePoint interpolarPosicion(
    RoutePoint inicio,
    RoutePoint fin,
    double progreso,
  ) {
    return RoutePoint(
      latitude: inicio.latitude + (fin.latitude - inicio.latitude) * progreso,
      longitude:
          inicio.longitude + (fin.longitude - inicio.longitude) * progreso,
    );
  }

  void iniciarSimulacion() {
    busTimer?.cancel();

    if (routePoints.length < 2) {
      return;
    }

    busPointIndex = 0;

    double progreso = 0.0;

    busTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (busPointIndex >= routePoints.length - 1) {
        setState(() {
          busPosition = routePoints.last;
        });

        timer.cancel();
        return;
      }

      final inicio = routePoints[busPointIndex];
      final fin = routePoints[busPointIndex + 1];

      progreso += 0.08;

      if (progreso >= 1.0) {
        busPointIndex++;
        progreso = 0.0;
        verificarProximidadParadas();
        setState(() {
          busPosition = routePoints[busPointIndex];
        });
        verificarProximidadParadas();
        return;
      }

      setState(() {
        busPosition = interpolarPosicion(inicio, fin, progreso);
      });
    });
  }

  void centrarMapa() {
    final controller = mapController;

    if (controller == null) {
      return;
    }

    controller.animateCamera(center: Position(-75.2322, 4.4389), zoom: 16);
  }

  @override
  void dispose() {
    busTimer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tracking')),
      body: Stack(
        children: [
          TrackingMap(
            routePoints: routePoints,
            stops: stops,
            busPosition: busPosition,
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
