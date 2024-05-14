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
Future<Order> addNewOrder(Order order) async {
  try {
    Response<Map<String, dynamic>> response =
        await dio.post('/api/v1/order', data: order.toJson());

    if (response.statusCode == 200) {
      // Check if data is not null and has the expected structure
      if (response.data != null && response.data?['data'] != null) {
        return Order.fromJson(response.data!['data']);
      } else {
        throw Exception('Failed to parse response data');
      }
    } else {
      throw Exception('Failed to add new order. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle Dio errors or server errors
    print('Error: $e');
    throw Exception('Failed to add new order: $e');
  }
}

  // Future<Order?> addNewOrder(Order order) async {
  //   try {
  //     Response<Map<String, dynamic>> response =
  //         await dio.post('/api/v1/order', data: order.toJson());

  //     return Order.fromJson(response.data?['data']);
  //   } catch (e) {
  //     // Handle Dio errors or server errors
  //     print('Error: $e');
  //     throw Exception('Failed to add new order: $e');
  //   }
  // }

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
