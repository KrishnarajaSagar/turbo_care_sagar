import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbo_care_sagar/providers/vehicles_provider.dart';
import 'package:turbo_care_sagar/screens/vehicle_fuel_screen.dart';
import 'package:turbo_care_sagar/screens/vehicle_list_screen.dart';
import 'package:turbo_care_sagar/screens/vehicle_make_screen.dart';
import 'package:turbo_care_sagar/screens/vehicle_model_screen.dart';
import 'package:turbo_care_sagar/screens/vehicle_number_screen.dart';
import 'package:turbo_care_sagar/screens/vehicle_overview_screen.dart';
import 'package:turbo_care_sagar/screens/vehicle_transmission_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => VehiclesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const VehicleListScreen(),
        routes: {
          'vehicle_list' : (context) => const VehicleListScreen(),
          'vehicle_overview': (context) => const VehicleOverviewScreen(),
          'vehicle_num' : (context) => const VehicleNumberScreen(),
          'vehicle_make' : (context) => const VehicleMakeScreen(),
          'vehicle_model' : (context) => const VehicleModelScreen(),
          'vehicle_fuel' : (context) => const VehicleFuelScreen(),
          'vehicle_transmission' : (context) => const VehicleTransmissionScreen(),
        },
      ),
    );
  }
}