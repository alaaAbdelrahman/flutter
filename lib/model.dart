class User {
  String userName;
  String password;
  User({
    required this.userName,
    required this.password,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json['Username'],
      password: json['Password'],
    );
  }
}
