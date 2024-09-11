import 'package:flutter/material.dart';


class ItemFour extends StatelessWidget {
  const ItemFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              color: Colors.grey,
              child: const Text("PInki Kumar 4"),
            )
          ],)

        ],
      ),
    );
  }
}