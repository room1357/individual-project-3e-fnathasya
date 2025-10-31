class User {
  final String username;
  final String email;
  final String phone;
  final String role;

  User({
    required this.username,
    this.email = '',
    this.phone = '',
    this.role = 'FLUTTER DEVELOPER',
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'phone': phone,
        'role': role,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json['username'] ?? '',
        email: json['email'] ?? '',
        phone: json['phone'] ?? '',
        role: json['role'] ?? 'FLUTTER DEVELOPER',
      );
}
