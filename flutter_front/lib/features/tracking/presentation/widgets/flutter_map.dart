import 'package:flutter/material.dart';
import 'package:maplibre/maplibre.dart';

import 'package:flutter_application_1/features/tracking/domain/entities/puntos_ruta.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';
import 'package:flutter_application_1/features/tracking/domain/entities/paradas_bus.dart';
import 'package:flutter_application_1/features/tracking/presentation/widgets/marcador_paradas.dart';
import 'package:flutter_application_1/features/tracking/presentation/widgets/busesito.dart';

class TrackingMap extends StatelessWidget {
  final void Function(MapController) onMapCreated;
  final List<RoutePoint> routePoints;
  final List<RouteStop> stops;
  final RoutePoint? busPosition;

  const TrackingMap({
    super.key,
    required this.onMapCreated,
    required this.routePoints,
    required this.stops,
    this.busPosition,
  });

  @override
  Widget build(BuildContext context) {
    final positions = routePoints
        .map((point) => Position(point.longitude, point.latitude))
        .toList();

    return MapLibreMap(
      options: MapOptions(
        initStyle: 'https://tiles.openfreemap.org/styles/positron',
        initCenter: Position(-75.2322, 4.4389),
        initZoom: 14,
      ),

      onMapCreated: onMapCreated,

      layers: routePoints.isEmpty
          ? const []
          : [
              PolylineLayer(
                polylines: [LineString(coordinates: positions)],
                color: AppColors.boton1,
                width: 5,
              ),
            ],
      children: [
        WidgetLayer(
          markers: [
            ...stops.map((stop) {
              final isSchool = stop.name == 'Colegio';

              return Marker(
                point: Position(stop.longitude, stop.latitude),
                size: const Size(38, 38),
                alignment: Alignment.bottomCenter,
                child: StopMarker(label: '${stop.order}', isSchool: isSchool),
              );
            }),

            if (busPosition != null)
              Marker(
                point: Position(busPosition!.longitude, busPosition!.latitude),
                size: const Size(44, 44),
                alignment: Alignment.center,
                child: const BusMarker(),
              ),
          ],
        ),
      ],
    );
  }
}
