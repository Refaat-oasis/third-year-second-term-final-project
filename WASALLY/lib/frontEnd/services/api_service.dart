// ignore_for_file: avoid_print, unused_local_variable

import 'package:Wasally/frontEnd/models/order.dart';
import 'package:dio/dio.dart';
import 'package:Wasally/frontEnd/models/user_model.dart';

class ApiService {
  late Dio dio;

  ApiService() {
    dio = Dio(
      // change every time
      BaseOptions(
        baseUrl: "http://192.168.1.16:3000",
      ),
    );
  }
  Future<user_model?> addNewUser(user_model user) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.post('/api/v1/user', data: user.toJson());

      return user_model.fromJson(response.data?['data']);
    } catch (e) {
      // Handle Dio errors or server errors
      print('Error: $e');
      throw Exception('Failed to add new user: $e');
    }
  }

  Future<user_model?> updateUser(user_model user, id) async {
    try {
      String? userID = id;
      Response<Map<String, dynamic>> response =
          await dio.patch('/api/v1/user/$userID', data: user.toJson());

      return user_model.fromJson(response.data?['data']);
    } catch (e) {
      // Handle Dio errors or server errors
      print('Error in the update user service: $e');
      throw Exception('Failed to update user: $e');
    }
  }

  Future<user_model> forgetPassword(String email) async {
    // try {
      // Send GET request to the forgetPassword endpoint with email as query parameter
      Response response = await dio.get(
        '/api/v1/user/forget',
        data: {
          'email': email,
        },
      );

      // Check response status
      if (response.statusCode == 200) {
        // Request successful, parse response data and return user_model
        return user_model.fromJson(response.data['data']);
      } else {
        // Request failed, throw exception with error message
        throw Exception('Failed to forget password');
      }
    // } catch (error) {
    //   // Request failed due to an error, throw exception with error message
    //   throw Exception('Failed to forget password: $error');
    // }
  }

  Future<user_model?> authenticate(String email, String password) async {
    try {
      Response response = await dio.get(
        '/api/v1/user/authentication',
        data: {
          'email': email,
          'password': password,
        },
      );

      // Check if request was successful
      if (response.statusCode == 200) {
        // Ensure data is not null before parsing
        if (response.data != null && response.data['data'] != null) {
          return user_model.fromJson(response.data['data']);
        } else {
          // Handle unexpected response format
          print('Error: Unexpected response format');
          return null;
        }
      } else {
        // Handle server errors
        print('Error: Server returned ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle Dio errors
      print('Error: $e');
      return null;
    }
  }

  Future<List<Order>> getAllOrders() async {
    try {
      Response<Map<String, dynamic>> response = await dio.get('/api/v1/order');

      // Check if the response status code is successful
      if (response.statusCode == 200) {
        // Parse the JSON response into a list of orders
        List<dynamic> orderData = response.data?['data'] ?? [];
        List<Order> orders =
            orderData.map((data) => Order.fromJson(data)).toList();

        return orders;
      } else {
        // Handle non-successful responses
        throw Exception(
            'Failed to get all orders. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle Dio errors or server errors
      print('Error: $e');
      throw Exception('Failed to get all orders: $e');
    }
  }

  Future<Order?> addNewOrder(Order order) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.post('/api/v1/order', data: order.toJson());

      return Order.fromJson(response.data?['data']);
    } catch (e) {
      // Handle Dio errors or server errors
      print('Error: $e');
      throw Exception('Failed to add new order: $e');
    }
  }

  Future<void> deleteOrder(Order order) async {
    try {
      String? id = order.id;
      // Response<Map<String, dynamic>> response =
      await dio.delete("/api/v1/order/$id");
    } catch (e) {
      // Handle Dio errors or server errors
      print('Error: $e');
      throw Exception('Failed to delete order: $e');
    }
  }
}
