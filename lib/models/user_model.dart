import 'dart:io';

class UserModel {
  String name;
  String userID;
  int age;
  String bio;
  String country;
  String? gender;
  String? likes;
  String? followers;
  String? following;
  String imageUrl;
  File? imageFile;

  UserModel({
    required this.name,
    required this.userID,
    required this.age,
    required this.bio,
    required this.country,
    required this.imageUrl,
    this.imageFile,
    this.gender,
    this.likes,
    this.followers,
    this.following,
  });
}
