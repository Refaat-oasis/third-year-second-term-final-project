// ignore_for_file: avoid_print, camel_case_types

import 'package:Wasally/frontEnd/models/order.dart';
import 'package:Wasally/frontEnd/models/user_model.dart';
import 'package:Wasally/frontEnd/services/api_service.dart';
import 'package:flutter/material.dart';

class history extends StatefulWidget {
  final user_model? loggedUser;
  const history({Key? key, this.loggedUser}) : super(key: key);

  @override
  HistoryState createState() => HistoryState();
}

class HistoryState extends State<history> {
  List<Order> orders = []; // Update to hold Order objects

  @override
  void initState() {
    super.initState();
    fetchOrders(); // Call the function to fetch orders when the widget initializes
  }

  Future<void> fetchOrders() async {
    try {
      // Call your API service method to fetch orders
      // List<Order> fetchedOrders = await ApiService().getAllOrders();

      List<Order> fetchedOrders =
          await ApiService().getAllOrdersWithParams(widget.loggedUser!.id!);

      setState(() {
        // Update the orders list with the fetched orders
        orders = fetchedOrders;
      });
    } catch (error) {
      // Handle any exceptions that might occur during the process
      print('Error fetching orders: $error');
      // Optionally, you can show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Deliverd Orders"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildOrderItem(orders[index]),
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.grey,
                    thickness: 2.5,
                  ),
                  itemCount: orders.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOrderItem(Order order) {
    // Here, you can build each item using the order information
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                const CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.orange,
                ),
                Container(
                  height: 14,
                  color: Colors.orange,
                  width: 4,
                ),
                const Icon(
                  Icons.location_on,
                  color: Colors.orange,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Icon(Icons.phone, color: Colors.orange),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    'order id : ${order.id}',
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        order.sourceStreet,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    order.destinationStreet,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    order.sourceContactPhone,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Divider(
                    color: Colors.orangeAccent,
                    thickness: 3,
                    endIndent: 25,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        order.orderPrice ?? "",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
