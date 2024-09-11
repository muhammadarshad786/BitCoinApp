import 'package:flutter/material.dart';


class ItemFive extends StatelessWidget {
  const ItemFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              color: Colors.grey,
              child: const Text("PInki Kumar 5"),
            )
          ],)

        ],
      ),
    );
  }
}