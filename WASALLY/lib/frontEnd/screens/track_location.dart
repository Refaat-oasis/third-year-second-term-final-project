// ignore_for_file: sized_box_for_whitespace, avoid_print, avoid_unnecessary_containers, unused_element, prefer_const_constructors, use_build_context_synchronously

import 'dart:async';
import 'package:Wasally/frontEnd/layout/layout.dart';
import 'package:Wasally/frontEnd/models/order.dart';
import 'package:Wasally/frontEnd/models/user_model.dart';
import 'package:Wasally/frontEnd/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'orderreceivedscreen.dart';

class TrackingLocationScreen extends StatefulWidget {
  final Order sentOrder;
  final user_model loggeduser;
  const TrackingLocationScreen(
      {Key? key, required this.sentOrder, required this.loggeduser})
      : super(key: key);

  @override
  State<TrackingLocationScreen> createState() => _TrackingLocationScreenState();
}

class _TrackingLocationScreenState extends State<TrackingLocationScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    getUserLocation();
  }

  CameraPosition? myLocation;
  int index = 0;
  Set<Marker> markers = {};
  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 493,
            child: myLocation == null
                ? const Center(child: CircularProgressIndicator())
                : GoogleMap(
                    mapType: MapType.hybrid,
                    onTap: (argument) {
                      setState(() {});
                      index++;

                      markers.add(
                        Marker(
                          markerId: MarkerId("myLocation$index"),
                          position: argument,
                        ),
                      );
                    },
                    markers: markers,
                    initialCameraPosition: myLocation!,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 11,
                          ),
                          const Icon(
                            Icons.person,
                            color: Colors.orange,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.orange,
                          ),
                          Container(
                            height: 20,
                            color: Colors.orange,
                            width: 4,
                          ),
                          const Icon(
                            Icons.location_on,
                            color: Colors.orange,
                          ),
                          const Icon(Icons.phone, color: Colors.orange),
                        ],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 300,
                        height: 600,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(children: [
                              Text(widget.loggeduser.name,
                                  style: TextStyle(fontSize: 17)),
                            ]),
                            const Divider(
                              color: Colors.orangeAccent,
                              thickness: 1.5,
                              endIndent: 25,
                            ),
                            Text(widget.sentOrder.sourceStreet,
                                style: TextStyle(fontSize: 18)),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(widget.sentOrder.destinationStreet,
                                style: TextStyle(fontSize: 18)),
                            Text(widget.sentOrder.sourceContactPhone,
                                style: TextStyle(
                                  fontSize: 18,
                                )),
                            const Divider(
                              color: Colors.orangeAccent,
                              thickness: 1.5,
                              endIndent: 25,
                            ),
                            Row(
                              children: [
                                Text(widget.sentOrder.orderPrice ?? "20\$",
                                    style: TextStyle(fontSize: 18)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.orange),
                                  ),
                                  onPressed: () {
                                    // Navigate to the OrderReceivedScreen with a simple animation
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration:
                                            const Duration(milliseconds: 500),
                                        pageBuilder: (_, __, ___) =>
                                            OrderReceivedScreen(
                                                loggeduser: widget.loggeduser),
                                        transitionsBuilder:
                                            (_, animation, __, child) {
                                          return FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Order Received",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                    width:
                                        10), // Add some space between the buttons
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red),
                                  ),
                                  onPressed: () async {
                                    await ApiService()
                                        .deleteOrder(widget.sentOrder);
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration:
                                            const Duration(milliseconds: 500),
                                        pageBuilder: (_, __, ___) =>
                                            LayoutScreen(
                                                loggedUser: widget.loggeduser),
                                        transitionsBuilder:
                                            (_, animation, __, child) {
                                          return FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Cancel Order",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Location location = Location();

  StreamSubscription<LocationData>? subscription;

  LocationData? locationData;

  PermissionStatus status = PermissionStatus.denied;

  bool isServiceEnabled = false;

  Future<bool> checkPermission() async {
    status = await location.hasPermission();
    if (status == PermissionStatus.denied) {
      status = await location.requestPermission();
    }
    return (status == PermissionStatus.granted ||
        status == PermissionStatus.grantedLimited);
  }

  Future<bool> checkService() async {
    isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
    }
    return isServiceEnabled;
  }

  getUserLocation() async {
    bool permission = await checkPermission();
    bool service = await checkService();

    if (!permission) return;
    if (!service) return;

    locationData = await location.getLocation();
    location.changeSettings(accuracy: LocationAccuracy.high);
    subscription = location.onLocationChanged.listen((event) {
      locationData = event;
      markers.add(
        Marker(
          markerId: const MarkerId('myLocation'),
          position: LatLng(event.latitude!, event.longitude!),
        ),
      );
      myLocation = CameraPosition(
        target: LatLng(event.latitude!, event.longitude!),
        zoom: 14.4746,
      );
      setState(() {});
    });

    print("lat: ${locationData?.latitude} , long: ${locationData?.longitude}");
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
