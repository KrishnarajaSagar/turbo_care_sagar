import 'package:flutter/material.dart';

Container listWidget(String title, VoidCallback onTap) {
  return Container(
    margin: const EdgeInsets.only(
      left: 20,
      right: 20,
      top: 20,
    ),
    child: Column(
      children: [
        ListTile(
          title: Text("$title"),
          trailing: const Icon(Icons.arrow_right_rounded),
          onTap: onTap,
        ),
        const Divider(),
      ],
    ),
  );
}