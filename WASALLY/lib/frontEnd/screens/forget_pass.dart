// ignore_for_file: sized_box_for_whitespace, use_key_in_widget_constructors, library_private_types_in_public_api, unused_field

import 'package:Wasally/frontEnd/login_signup/signupcustomer_screen.dart';
import 'package:Wasally/frontEnd/screens/reset_pass.dart';
import 'package:flutter/material.dart';
import './../login_signup/login_screen.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forgot Password Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ForgetPasswordScreen(),
    );
  }
}

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Text(
                      'We will send you an email to reset your password',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    width: 300,
                    height: 58,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'required user address';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.orange),
                              borderRadius: BorderRadius.circular(28)),
                          labelText: "Email address",
                          labelStyle: const TextStyle(color: Colors.black),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28))),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 600,
                    height: 55,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28)),
                      color: Colors.orange,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResestPasswordScreen(),
                            ));
                      },
                      child: const Text("Reset a password",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpCustomer(),
                            ));
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>const LoginScreen(),
                          ));
                    },
                    child: const Text(
                      'OR Login',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}