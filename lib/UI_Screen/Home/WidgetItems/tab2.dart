import 'package:flutter/material.dart';


class ItemTwo extends StatelessWidget {
  const ItemTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              color: Colors.grey,
              child: const Text("PInki Kumar 2"),
            )
          ],)

        ],
      ),
    );
  }
}