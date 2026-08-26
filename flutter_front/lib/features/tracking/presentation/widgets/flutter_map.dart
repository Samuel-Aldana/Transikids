import 'package:flutter/material.dart';
import 'package:maplibre/maplibre.dart';

import 'package:flutter_application_1/features/tracking/domain/entities/puntos_ruta.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';

class TrackingMap extends StatelessWidget {
  final void Function(MapController) onMapCreated;
  final List<RoutePoint> routePoints;

  const TrackingMap({
    super.key,
    required this.onMapCreated,
    required this.routePoints,
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
    );
  }
}
