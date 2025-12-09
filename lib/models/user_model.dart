class UserModel {
  final String uid;
  final String email;
  final String? name;
  final String? phoneNumber;
  final String? address;

  UserModel({
    required this.uid,
    required this.email,
    this.name,
    this.phoneNumber,
    this.address,
  });

  factory UserModel.fromMap(Map<String, dynamic> data, String uid) {
    return UserModel(
      uid: uid,
      email: data['email'] ?? '',
      name: data['name'],
      phoneNumber: data['phoneNumber'],
      address: data['address'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }
}
