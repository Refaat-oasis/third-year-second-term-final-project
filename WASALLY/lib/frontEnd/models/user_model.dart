// ignore_for_file: camel_case_types

class user_model {
  late String? id;
  late String name;
  late String email;
  late String mobilePhone;
  late String password;

  user_model(
      {this.id,
      required this.email,
      required this.name,
      required this.password,
      required this.mobilePhone});

  factory user_model.fromJson(Map<String, dynamic> json) => user_model(
      id: json['_id'],
      email: json['email'],
      name: json['name'],
      password: json['password'],
      mobilePhone: json['mobilePhone']);

  Map<String, dynamic> toJson() => {
        "name": name,
        'email': email,
        'mobilePhone': mobilePhone,
        "password": password,
      };
}
