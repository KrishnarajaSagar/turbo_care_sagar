import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../components.dart';

Future<List> fetchMake(int w) async {
  final response = await http
      .get(Uri.parse('https://test.turbocare.app/turbo/care/v1/makes?class=${w.toString()}w'));

  if (response.statusCode == 200) {
    List<dynamic> make = json.decode(response.body);
    return make;
  } else {
    throw Exception('Failed to load makes');
  }
}

class VehicleMakeScreen extends StatefulWidget {
  const VehicleMakeScreen({Key? key}) : super(key: key);

  @override
  State<VehicleMakeScreen> createState() => _VehicleMakeScreenState();
}

class _VehicleMakeScreenState extends State<VehicleMakeScreen> {

  late Future<List> make;
  // https://test.turbocare.app/turbo/care/v1/makes?
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final  Map rcvdData = ModalRoute.of(context)?.settings.arguments as Map;
    int wheels = rcvdData["wheels"];
    make = fetchMake(wheels);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Make"),
      ),
      body: FutureBuilder<List>(
        future: make,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            List? makeList = snapshot.data;
            return ListView.builder(
              itemCount: makeList?.length,
              itemBuilder: (context, i) {
                return listWidget(makeList![i],() {
                  final makeMap = <String,String>{"make":makeList[i]};
                  rcvdData.addEntries(makeMap.entries);
                  Navigator.of(context).pushNamed(
                    'vehicle_model',
                    arguments: rcvdData,
                  );
                });
              },
            );
          }
          else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
