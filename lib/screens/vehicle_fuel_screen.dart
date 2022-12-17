import 'package:flutter/material.dart';

import '../components.dart';

class VehicleFuelScreen extends StatefulWidget {
  const VehicleFuelScreen({Key? key}) : super(key: key);

  @override
  State<VehicleFuelScreen> createState() => _VehicleFuelScreenState();
}

class _VehicleFuelScreenState extends State<VehicleFuelScreen> {

  late List fuelTypes;

  @override
  void initState() {
    fuelTypes = [
      "Petrol",
      "Diesel",
      "CNG",
      "Petrol+CNG",
      "Electric",
      "Hybrid",
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final  Map rcvdData = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select fuel type"),
      ),
      body: ListView.builder(
        itemCount: fuelTypes.length,
        itemBuilder: (context, i) {
          return listWidget(fuelTypes[i],() {
            final fuelMap = <String,String>{"fuel":fuelTypes[i]};
            rcvdData.addEntries(fuelMap.entries);
            Navigator.of(context).pushNamed(
              'vehicle_transmission',
              arguments: rcvdData,
            );
          });
        },
      ),
    );
  }
}