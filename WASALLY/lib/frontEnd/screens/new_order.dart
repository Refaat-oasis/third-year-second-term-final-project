// ignore_for_file: sized_box_for_whitespace, unused_import, equal_keys_in_map, avoid_print, must_be_immutable, dead_code, use_build_context_synchronously

import 'dart:developer';
<<<<<<< HEAD
import 'package:Wasally/frontEnd/screens/delivery_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
=======
// import 'package:wasally/lib/frontEnd/models/order.dart';
import 'package:Wasally/frontEnd/models/order.dart';
import 'package:Wasally/frontEnd/services/api_service.dart';
>>>>>>> d81a1154de64715434a1f6d1d8c6c2d6eb574ba8
import 'package:flutter/material.dart';
import '../screens/tracking_screen.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({super.key});

  @override
  State<NewOrderScreen> createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrderScreen> {
  final TextEditingController fromcity = TextEditingController();
  final TextEditingController dlelivaryMethod = TextEditingController();
  final TextEditingController fromstreet = TextEditingController();
  final TextEditingController fromhouse = TextEditingController();
  final TextEditingController fromflat = TextEditingController();
  final TextEditingController fromname = TextEditingController();
  final TextEditingController fromphone = TextEditingController();
  final TextEditingController fromaddress = TextEditingController();
  final TextEditingController tocity = TextEditingController();
  final TextEditingController tostreet = TextEditingController();
  final TextEditingController tohouse = TextEditingController();
  final TextEditingController toflat = TextEditingController();
  final TextEditingController toname = TextEditingController();
  final TextEditingController tophone = TextEditingController();
  final TextEditingController toaddress = TextEditingController();
<<<<<<< HEAD

   Future addneworder() async {
     try {
       await FirebaseFirestore.instance.collection('neworder').add({
         'fromcity': fromcity.text.trim(),
         'fromstreet': fromstreet.text.trim(),
         'fromhouse': fromhouse.text.trim(),
         'fromflat': fromflat.text.trim(),
         'fromname': fromname.text.trim(),
         'fromphone': fromphone.text.trim(),
         'toaddress': fromaddress.text.trim(),
         'tocity': tocity.text.trim(),
         'tostreet': tostreet.text.trim(),
         'tohouse': tohouse.text.trim(),
         'toflat': toflat.text.trim(),
         'toname': toname.text.trim(),
         'tophone': tophone.text.trim(),
         'toaddress': toaddress.text.trim(),
         'createdAt': DateTime.now(),
         'deliverymethod': deliverymethod,
         'drivername': "",
       });
       print('Order added successfully!');
     } catch (e) {
       print('Error adding order: $e');
     }
   }

    late String deliverymethod;
   Neworder sendorder() {
     String startpos = fromstreet.text.trim();
     String endpos = tostreet.text.trim();
     String startphone = fromphone.text.trim();
     if (isCourierSelected) {
       deliverymethod = "courier";
     } else if (isCarSelected) {
       deliverymethod = "car";
     } else if (isTruckSelected) {
       deliverymethod = "truck";
     }
     Neworder neworder = Neworder(startpos, endpos, startphone, deliverymethod);
     return neworder;
   }

  var formKey = GlobalKey<FormState>();
  bool isCourierSelected = false;
  bool isCarSelected = false;
  bool isTruckSelected = false;
=======
  bool courierpressed = false;
  bool carpressed = false;
  bool truckpressed = false;

  var formKey = GlobalKey<FormState>();

>>>>>>> d81a1154de64715434a1f6d1d8c6c2d6eb574ba8
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Create a new order',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Delivery method :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
<<<<<<< HEAD
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RadioListTile(
                        title: Text('Courier'),
                        subtitle: Text('Up to 10 kg'),
                        value: true,
                        groupValue: isCourierSelected,
                        onChanged: (value) {
                          setState(() {
                            isCourierSelected = value as bool;
                          });
                          if (value == true) {
                            print('Courier button pressed');
                          }
                        },
                        secondary: Icon(
                          Icons.directions_run,
                          color:
                              isCourierSelected ? Colors.white : Colors.black,
=======
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        print('Courier button pressed');

                        setState(() {
                          courierpressed = !courierpressed;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor:
                            courierpressed ? Colors.orange : Colors.grey[350],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
>>>>>>> d81a1154de64715434a1f6d1d8c6c2d6eb574ba8
                        ),
                        selected: isCourierSelected,
                        activeColor: Colors.orange,
                      ),
<<<<<<< HEAD
                      RadioListTile(
                        title: Text('Car'),
                        subtitle: Text('Up to 60 kg'),
                        value: true,
                        groupValue: isCarSelected,
                        onChanged: (value) {
                          setState(() {
                            isCarSelected = value as bool;
                          });
                          if (value == true) {
                            print('Car button pressed');
                          }
                        },
                        secondary: Icon(
                          Icons.directions_car_rounded,
                          color: isCarSelected == true
                              ? Colors.white
                              : Colors.black,
=======
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.directions_run,
                            color: courierpressed ? Colors.white : Colors.black,
                          ),
                          Text(
                            'Courier',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color:
                                  courierpressed ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            'Up to 10 kg',
                            style: TextStyle(
                              color:
                                  courierpressed ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print('Car button pressed');
                        carpressed = !carpressed;
                      },
                      style: TextButton.styleFrom(
                        backgroundColor:
                            carpressed ? Colors.orange : Colors.grey[350],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
>>>>>>> d81a1154de64715434a1f6d1d8c6c2d6eb574ba8
                        ),
                        selected: isCarSelected == true,
                        activeColor: Colors.orange,
                      ),
                      RadioListTile(
                        title: Text('Truck'),
                        subtitle: Text('> 60 kg'),
                        value: true,
                        groupValue: isTruckSelected,
                        onChanged: (value) {
                          setState(() {
                            isTruckSelected = value as bool;
                          });
                          if (value == true) {
                            print('Truck button pressed');
                          }
                        },
                        secondary: Icon(
                          Icons.local_shipping,
                          color: isTruckSelected == true
                              ? Colors.white
                              : Colors.black,
                        ),
                        selected: isTruckSelected == true,
                        activeColor: Colors.orange,
                      ),
                    ]
                    ),
<<<<<<< HEAD
                      ],
=======
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'From',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 49,
                  child: TextFormField(
                    controller: fromcity,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required city';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 49,
                  child: TextFormField(
                    controller: fromstreet,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required street name';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Street',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                      height: 49,
                      width: MediaQuery.of(context).size.width / 2.1,
                      child: TextFormField(
                        controller: fromhouse,
                        decoration: InputDecoration(
                          labelText: 'House',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(23)),
                        ),
                      ),
                    ),
                    Container(
                      height: 49,
                      width: MediaQuery.of(context).size.width / 2.1,
                      child: TextFormField(
                        controller: fromflat,
                        decoration: InputDecoration(
                          labelText: 'Flat',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(23)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Contact details',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 49,
                  child: TextFormField(
                    controller: fromname,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required sender name';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 49,
                  child: TextFormField(
                    controller: fromphone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required sender phone';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 49,
                  child: TextFormField(
                    controller: fromaddress,
                    decoration: InputDecoration(
                      labelText: 'Address information',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'To',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 49,
                  child: TextFormField(
                    controller: tocity,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required city';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 49,
                  child: TextFormField(
                    controller: tostreet,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required street';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Street',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                      height: 49,
                      width: MediaQuery.of(context).size.width / 2.1,
                      child: TextFormField(
                        controller: tohouse,
                        decoration: InputDecoration(
                          labelText: 'House',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(23)),
                        ),
                      ),
                    ),
                    Container(
                      height: 49,
                      width: MediaQuery.of(context).size.width / 2.1,
                      child: TextFormField(
                        controller: toflat,
                        decoration: InputDecoration(
                          labelText: 'Flat',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(23)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Contact details',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 49,
                  child: TextFormField(
                    controller: toname,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required reciever name';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 49,
                  child: TextFormField(
                    controller: tophone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'required reciever phone';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 49,
                  child: TextFormField(
                    controller: toaddress,
                    decoration: InputDecoration(
                      labelText: 'Address information',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(23)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 260,
                    height: 40,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      color: Colors.orange,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          Order order = Order(
                            creationDate: DateTime.now(),
                            dlelivaryMethod: "",

                            destinationCity: tocity.text,
                            destinationContactAddress: toaddress.text,
                            destinationContactPhone: tophone.text,
                            destinationFlat: toflat.text,
                            destinationHouse: tohouse.text,
                            destinationStreet: tostreet.text,
                            destinationContactName: toname.text,
                            sourceCity: fromcity.text,
                            sourceContactAddress: fromaddress.text,
                            sourceContactName: fromname.text,
                            sourceContactPhone: fromphone.text,
                            sourceFlat: fromflat.text,
                            sourceHouse: fromhouse.text,
                            sourceStreet: fromstreet.text,

                            // dlelivaryMethod:
                          );

                          await ApiService().addNewOrder(order);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TrackingScreen(
                                    // isDriver: false,
                                    // neworder: sendorder(),
                                    // isaccepted: isaccepted,
                                    ),
                              ));
                        }
                      },
                      child: const Text(
                        "Create Order",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),
                  ),
                ),
              ],
>>>>>>> d81a1154de64715434a1f6d1d8c6c2d6eb574ba8
            ),
          ),
        ),
      ),
    
          const SizedBox(
               height: 10,
    );
                            const Text(
                                     'From',
                                style: TextStyle(
                                   fontSize: 22,
                             fontWeight: FontWeight.bold,
                                color: Colors.orange,
                                ),
                              ),
                              const SizedBox(
                           height: 8,
                          ),
                            const Text(
                             'Address',
                         style: TextStyle(
                            fontSize: 16,
                        fontWeight: FontWeight.bold,
                     ),
                    ),
                      const SizedBox(
                        height: 8,
                      ),
                    Container(
                  height: 49,
                 child: TextFormField(
                 controller: fromcity,
                    validator: (value) {
                   if (value!.isEmpty) {
                    return 'required city';
                      } else {
                         return null;
            }
          },
          decoration: InputDecoration(
            labelText: 'City',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
          ),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        height: 49,
        child: TextFormField(
          controller: fromstreet,
          validator: (value) {
            if (value!.isEmpty) {
              return 'required street name';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            labelText: 'Street',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
          ),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Row(
        children: [
          Container(
            height: 49,
            width: MediaQuery.of(context).size.width / 2.1,
            child: TextFormField(
              controller: fromhouse,
              decoration: InputDecoration(
                labelText: 'House',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
              ),
            ),
          ),
          Container(
            height: 49,
            width: MediaQuery.of(context).size.width / 2.1,
            child: TextFormField(
              controller: fromflat,
              decoration: InputDecoration(
                labelText: 'Flat',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 8,
      ),
      const Text(
        'Contact details',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        height: 49,
        child: TextFormField(
          controller: fromname,
          validator: (value) {
            if (value!.isEmpty) {
              return 'required sender name';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
          ),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        height: 49,
        child: TextFormField(
          controller: fromphone,
          validator: (value) {
            if (value!.isEmpty) {
              return 'required sender phone';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            labelText: 'Phone',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
          ),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        height: 49,
        child: TextFormField(
          controller: fromaddress,
          decoration: InputDecoration(
            labelText: 'Address information',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const Text(
        'To',
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
      ),
      const SizedBox(
        height: 8,
      ),
      const Text(
        'Address',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        height: 49,
        child: TextFormField(
          controller: tocity,
          validator: (value) {
            if (value!.isEmpty) {
              return 'required city';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            labelText: 'City',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(23),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        height: 49,
        child: TextFormField(
          controller: tostreet,
          validator: (value) {
            if (value!.isEmpty) {
              return 'required street';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            labelText: 'Street',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(23),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Row(
        children: [
          Container(
            height: 49,
            width: MediaQuery.of(context).size.width / 2.1,
            child: TextFormField(
              controller: tohouse,
              decoration: InputDecoration(
                labelText: 'House',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
              ),
            ),
          ),
          Container(
            height: 49,
            width: MediaQuery.of(context).size.width / 2.1,
            child: TextFormField(
              controller: toflat,
              decoration: InputDecoration(
                labelText: 'Flat',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 8,
      ),
      const Text(
        'Contact details',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        height: 49,
        child: TextFormField(
          controller: toname,
          validator: (value) {
            if (value!.isEmpty) {
              return 'required reciever name';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
          ),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        height: 49,
        child: TextFormField(
          controller: tophone,
          validator: (value) {
            if (value!.isEmpty) {
              return 'required reciever phone';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
            labelText: 'Phone',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
          ),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        height: 49,
        child: TextFormField(
          controller: toaddress,
          decoration: InputDecoration(
            labelText: 'Address information',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(23)),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Align(
        alignment: Alignment.center,
        child: Container(
          width: 260,
          height: 40,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            color: Colors.orange,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // addneworder();
                //  const bool isaccepted = false;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TrackingScreen(
                          // isDriver: false,
                          // neworder: sendorder(),
                          // isaccepted: isaccepted,
                          ),
                    ));
              }
            },
            child: const Text(
              "Create Order",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          ),
        ),
    );
  }
}
