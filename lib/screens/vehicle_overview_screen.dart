import 'package:flutter/material.dart';
import 'package:turbo_care_sagar/providers/vehicle.dart';

class VehicleOverviewScreen extends StatelessWidget {
  const VehicleOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vehicle = ModalRoute.of(context)?.settings.arguments as Vehicle;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            alignment: Alignment.bottomLeft,
            height: 200,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${vehicle.model} ${vehicle.fuelType}".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
                Text(
                  vehicle.vehicleNo.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    overviewText("MAKE", true),
                    overviewText(vehicle.make.toUpperCase(), false),
                    const SizedBox(height: 50,),
                    overviewText("FUEL TYPE", true),
                    overviewText(vehicle.fuelType.toUpperCase(), false),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    overviewText("MODEL", true),
                    overviewText(vehicle.model.toUpperCase(), false),
                    const SizedBox(height: 50,),
                    overviewText("TRANSMISSION", true),
                    overviewText(vehicle.transmissionType.toUpperCase(), false),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text overviewText(String s, bool isTitle) {
    return Text(
      s,
      style: TextStyle(
        fontWeight: isTitle ? FontWeight.w300 : FontWeight.w400,
        fontSize: 20,
      ),
    );
  }
}
