class VehiclePosition {
  final String vehicleId;
  final double latitude;
  final double longitude;
  final DateTime updatedAt;
  final double? speed;
  final double? heading;

  const VehiclePosition({
    required this.vehicleId,
    required this.latitude,
    required this.longitude,
    required this.updatedAt,
    this.speed,
    this.heading,
  });
}
