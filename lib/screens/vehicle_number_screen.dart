import 'package:flutter/material.dart';

class VehicleNumberScreen extends StatefulWidget {
  const VehicleNumberScreen({Key? key}) : super(key: key);

  @override
  State<VehicleNumberScreen> createState() => _VehicleNumberScreenState();
}

class _VehicleNumberScreenState extends State<VehicleNumberScreen> {
  String numPlate = "";
  int? wheels = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create new vehicle profile"),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter vehicle plate number",
              ),
              onChanged: (text) {
                setState(() {
                  numPlate = text;
                });
              },
            ),
            RadioListTile(
              title: const Text("2-Wheeler"),
              value: 2,
              groupValue: wheels,
              onChanged: (value) {
                setState(() {
                  wheels = value;
                });
              },
            ),
            RadioListTile(
              title: const Text("4-Wheeler"),
              value: 4,
              groupValue: wheels,
              onChanged: (value) {
                setState(() {
                  wheels = value;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_right),
        onPressed: () {
          Navigator.of(context).pushNamed(
            'vehicle_make',
            arguments: {
              "num":numPlate,
              "wheels":wheels,
            },
          );
        },
      ),
    );
  }
}
