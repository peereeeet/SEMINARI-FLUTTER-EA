class UserModel {
  String id; // Remover `final`
  String name;
  String mail;
  String password;
  String comment;

  UserModel({
    required this.id,
    required this.name,
    required this.mail,
    required this.password,
    required this.comment,
  });

  void setUser({
    required String id,
    required String name,
    required String mail,
    required String password,
    required String comment,
  }) {
    this.id = id;
    this.name = name;
    this.mail = mail;
    this.password = password;
    this.comment = comment;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      mail: json['mail'] ?? '',
      password: json['password'] ?? '',
      comment: json['comment'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'mail': mail,
      'password': password,
      'comment': comment,
    };
  }
}
