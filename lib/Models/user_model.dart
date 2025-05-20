class UserModel {
  final int id;
  final String email;
  final String password;
  final String role;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    email: json['email'],
    password: json['password'],
    role: json['role'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'password': password,
    'role': role,
  };
}
