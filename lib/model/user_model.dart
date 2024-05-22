import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String name;
  final String phone;
  final String address;

  const UserModel({
    this.id,
    required this.name,
    required this.phone,
    required this.address,
  });
  toJson() {
    return {
      'Name': name,
      'Phone': phone,
      'Address': address,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return UserModel(
      name: data['name'],
      phone: data['phone'],
      address: data['address'],
    );
  }
}
