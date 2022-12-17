import 'package:flutter/material.dart';
import 'vehicle.dart';


class VehiclesProvider with ChangeNotifier {
  final List<Vehicle> _vehicleList = [
    Vehicle(
      vehicleNo: "MH237821",
      wheels: 4,
      make: "Ford",
      model: "Freestyle",
      fuelType: "Petrol",
      transmissionType: "Manual",
    ),
  ];

  List<Vehicle> get vehicleList {
    return [..._vehicleList];
  }

  void addVehicle(Vehicle v) {
    final newVehicle = Vehicle(
        vehicleNo: v.vehicleNo,
        wheels: v.wheels,
        make: v.make,
        model: v.model,
        fuelType: v.fuelType,
        transmissionType: v.transmissionType);
    _vehicleList.add(newVehicle);
    notifyListeners();
  }


}
