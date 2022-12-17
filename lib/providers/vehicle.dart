import 'package:flutter/material.dart';

class Vehicle with ChangeNotifier {
  late final String vehicleNo;
  late final int wheels;
  late final String model;
  late final String make;
  late final String fuelType;
  late final String transmissionType;

  Vehicle({
    required this.vehicleNo,
    required this.wheels,
    required this.make,
    required this.model,
    required this.fuelType,
    required this.transmissionType,
  });

}
