class User {
  final String? id;
  final String? email;
  final String? token;
  final String? name;

  User({this.id, this.email, this.token, this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      token: json['token'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'token': token,
      'name': name,
    };
  }
} 