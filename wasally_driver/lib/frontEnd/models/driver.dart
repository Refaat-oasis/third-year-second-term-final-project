class Driver {
  String name;
  String email;
  String password;
  String mobilePhone;
  String deliveryMethod;

  Driver({
    required this.name,
    required this.email,
    required this.password,
    required this.mobilePhone,
    required this.deliveryMethod,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'mobilePhone': mobilePhone,
        'deliveryMethod': deliveryMethod,
      };

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        name: json['name'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
        mobilePhone: json['mobilePhone'] as String,
        deliveryMethod: json['deliveryMethod'] as String,
      );
}