//Este codigo no tengo idea como funciona, pero fue lo que la api me pidio

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_application_1/features/tracking/domain/entities/paradas_bus.dart';
import 'package:flutter_application_1/features/tracking/domain/entities/puntos_ruta.dart';

class RoutingService {
  static const String _apiKey = String.fromEnvironment('ORS_API_KEY');

  final http.Client _client;

  RoutingService({http.Client? client}) : _client = client ?? http.Client();

  Future<List<RoutePoint>> obtenerRuta(List<RouteStop> stops) async {
    if (_apiKey.isEmpty) {
      throw Exception('Falta ORS_API_KEY');
    }

    if (stops.length < 2) {
      throw Exception('La ruta necesita mínimo 2 puntos');
    }

    final orderedStops = [...stops]..sort((a, b) => a.order.compareTo(b.order));

    final coordinates = orderedStops
        .map((stop) => [stop.longitude, stop.latitude])
        .toList();

    final response = await _client.post(
      Uri.parse(
        'https://api.heigit.org/openrouteservice/v2/directions/driving-car/geojson',
      ),
      headers: {'Authorization': _apiKey, 'Content-Type': 'application/json'},
      body: jsonEncode({'coordinates': coordinates}),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Error obteniendo ruta: ${response.statusCode} ${response.body}',
      );
    }

    final data = jsonDecode(response.body);

    final geometry = data['features'][0]['geometry']['coordinates'] as List;

    return geometry.map<RoutePoint>((coordinate) {
      return RoutePoint(
        latitude: (coordinate[1] as num).toDouble(),
        longitude: (coordinate[0] as num).toDouble(),
      );
    }).toList();
  }

  void dispose() {
    _client.close();
  }
}
