class User {
  String? id;
  String name;
  String email;
  String mobilePhone;
  String password;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.mobilePhone,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'mobilePhone': mobilePhone,
        'password': password,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'] as String,
        email: json['email'] as String,
        mobilePhone: json['mobilePhone'] as String,
        password: json['password'] as String,
      );
}