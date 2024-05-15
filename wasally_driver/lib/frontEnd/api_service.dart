import 'package:dio/dio.dart';
import 'package:wasaalydriver/frontEnd/models/driver.dart';
import 'package:wasaalydriver/frontEnd/models/order.dart';
import 'package:wasaalydriver/frontEnd/models/user.dart';
class ApiService {
  late Dio dio;

  ApiService() {
    dio = Dio(
      // change every time
      BaseOptions(
        baseUrl: "http://192.168.1.204:3000",
      ),
    );
  }

  // Driver Signup
  Future<Driver?> createDriverSignup(Driver driver) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.post('/api/v1/driver/signup', data: driver.toJson());
      if (response.statusCode == 200) {
        return Driver.fromJson(response.data!);
      } else {
        throw Exception('Failed to create driver: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to create driver: $e');
    }
  }

  // Get All Orders by Status 'waiting'
  // Future<List<Order>?> getAllOrdersByStatus(String status) async {
  //   try {
  //     Response<List<dynamic>> response =
  //         await dio.get('/api/v1/order/status/$status');
  //     if (response.statusCode == 200) {
  //       return response.data!.map((order) => order.fromJson(order)).toList();
  //     } else {
  //       throw Exception('Failed to get orders: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     throw Exception('Failed to get orders: $e');
  //   }
  // }

Future<List<Order>?> getAllOrdersByStatus(String status) async {
  try {
    Response<List<dynamic>> response =
        await dio.get('/api/v1/order/status/$status');
    if (response.statusCode == 200) {
      List<Order> orders = response.data!.map((orderJson) => Order.fromJson(orderJson)).toList();
      return orders;
    } else {
      throw Exception('Failed to get orders: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    throw Exception('Failed to get orders: $e');
  }
}

  // Driver Authentication
  Future<bool> authenticateDriver(String email, String password) async {
    try {
      Response response = await dio.post(
        '/api/v1/driver/authenticate',
        data: {
          'email': email,
          'password': password,
        },
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  // Update Order
  Future<Order?> updateOrder(String id, Order order) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.put('/api/v1/orders/$id', data: order.toJson());
      if (response.statusCode == 200) {
        return Order.fromJson(response.data!);
      } else {
        throw Exception('Failed to update order: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to update order: $e');
    }
  }

  // Update Driver
  Future<Driver?> updateDriver(String id, Driver driver) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.put('/api/v1/driver/$id', data: driver.toJson());
      if (response.statusCode == 200) {
        return Driver.fromJson(response.data!);
      } else {
        throw Exception('Failed to update driver: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to update driver: $e');
    }
  }
}