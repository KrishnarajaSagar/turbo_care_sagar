import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:turbo_care_sagar/components.dart';

Future<List> fetchModel(int w, String make) async {
  final response = await http.get(Uri.parse(
      'https://test.turbocare.app/turbo/care/v1/models?class=${w.toString()}w&make=$make'));

  if (response.statusCode == 200) {
    List<dynamic> model = json.decode(response.body);
    return model;
  } else {
    throw Exception('Failed to load models');
  }
}

class VehicleModelScreen extends StatefulWidget {
  const VehicleModelScreen({Key? key}) : super(key: key);

  @override
  State<VehicleModelScreen> createState() => _VehicleModelScreenState();
}

class _VehicleModelScreenState extends State<VehicleModelScreen> {
  late Future<List> model;

  // https://test.turbocare.app/turbo/care/v1/makes?
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)?.settings.arguments as Map;
    String make = rcvdData["make"];
    int wheels = rcvdData["wheels"];
    model = fetchModel(wheels, make);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Model"),
      ),
      body: FutureBuilder<List>(
        future: model,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List? modelList = snapshot.data;
            return ListView.builder(
              itemCount: modelList?.length,
              itemBuilder: (context, i) {
                return listWidget(
                  modelList![i],
                  () {
                    final modelMap = <String, String>{"model": modelList[i]};
                    rcvdData.addEntries(modelMap.entries);
                    Navigator.of(context).pushNamed(
                      'vehicle_fuel',
                      arguments: rcvdData,
                    );
                  },
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
