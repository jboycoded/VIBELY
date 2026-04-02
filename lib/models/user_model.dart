class UserModel {
  String name;
  String userID;
  int age;
  String bio;
  String country;
  String imageUrl;
  File? imageFile;

  UserModel({
    required this.name,
    required this.userID,
    required this.age,
    required this.bio,
    required this.country,
    required this.imageUrl,
    this.imageFile = null,
  });
}
