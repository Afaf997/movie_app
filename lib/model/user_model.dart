class UserModel {
  final String? id;
  final String fullname;
  final String email;
  final int phonenumber;

  UserModel({
    this.id,
    required this.fullname,
    required this.email,
    required this.phonenumber,
  });

  Map<String, dynamic> toJson() {
    return {
      "Fullname": fullname,
      "Email": email,
      "Phone": phonenumber,
    };
  }
}