import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbo_care_sagar/providers/vehicles_provider.dart';


class VehicleListScreen extends StatefulWidget {
  const VehicleListScreen({Key? key}) : super(key: key);

  @override
  State<VehicleListScreen> createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vehicles"),
      ),
      body: Consumer<VehiclesProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.vehicleList.length,
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(provider.vehicleList[i].vehicleNo.toUpperCase()),
                      subtitle: Text("${provider.vehicleList[i].make} ${provider.vehicleList[i].model}"),
                      trailing: const Icon(Icons.arrow_right_rounded),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          'vehicle_overview',
                          arguments: provider.vehicleList[i],
                        );
                      },
                    ),
                    const Divider(),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('vehicle_num');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
