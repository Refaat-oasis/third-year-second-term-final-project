// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.orange, size: 35),
        title: const Text("Order Track"),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Container(
          width: 350,
          height: 333,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    const Icon(
                      Icons.person,
                      color: Colors.orange,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const CircleAvatar(
                      radius: 7,
                      backgroundColor: Colors.orange,
                    ),
                    Container(
                      height: 27,
                      color: Colors.orange,
                      width: 4,
                    ),
                    const Icon(
                      Icons.location_on,
                      color: Colors.orange,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Icon(Icons.phone, color: Colors.orange),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 300,
                  height: 700,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Row(children: [
                        Text('Mohammed saleh', style: TextStyle(fontSize: 20)),
                      ]),
                      const Divider(
                          color: Colors.orangeAccent,
                          thickness: 3,
                          endIndent: 25),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text('Benziena Mobile ',
                          style: TextStyle(fontSize: 25)),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text('Bus Station ',
                          style: TextStyle(fontSize: 25)),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text('0123456789',
                          style: TextStyle(
                            fontSize: 25,
                          )),
                      const Divider(
                          color: Colors.orangeAccent,
                          thickness: 3,
                          endIndent: 25),
                      const Row(children: [
                        Text('20\$', style: TextStyle(fontSize: 25)),
                        Spacer(),
                        Text('Waiting...',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.orange,
                            )),
                      ]),
                      Center(
                          child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.orange)),
                        onPressed: () {},
                        child: const Text(
                          "Order Received",
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
