import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbo_care_sagar/components.dart';
import 'package:turbo_care_sagar/providers/vehicles_provider.dart';
import 'package:turbo_care_sagar/screens/vehicle_list_screen.dart';

import '../providers/vehicle.dart';

class VehicleTransmissionScreen extends StatefulWidget {
  const VehicleTransmissionScreen({Key? key}) : super(key: key);

  @override
  State<VehicleTransmissionScreen> createState() =>
      _VehicleTransmissionScreenState();
}

class _VehicleTransmissionScreenState extends State<VehicleTransmissionScreen> {
  late List transmissionTypes;

  @override
  void initState() {
    transmissionTypes = [
      "Manual",
      "Automatic",
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select transmission type"),
      ),
      body: ListView.builder(
        itemCount: transmissionTypes.length,
        itemBuilder: (context, i) {
          return listWidget(transmissionTypes[i], () {
            final transmissionMap = <String, String>{
              "transmission": transmissionTypes[i]
            };
            rcvdData.addEntries(transmissionMap.entries);
            Vehicle v = Vehicle(
              vehicleNo: rcvdData["num"],
              wheels: rcvdData["wheels"],
              make: rcvdData["make"],
              model: rcvdData["model"],
              fuelType: rcvdData["fuel"],
              transmissionType: rcvdData["transmission"],
            );
            Provider.of<VehiclesProvider>(context,listen: false).addVehicle(v);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const VehicleListScreen()),
                    (Route<dynamic> route) => false);
          });
        },
      ),
    );
  }
}
