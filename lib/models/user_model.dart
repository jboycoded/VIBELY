import 'dart:io';
import 'badge_model.dart';

class UserModel {
  //basic details
  final String id;
  final String name;
  final String username;
  final String email;
  final int age;
  final String bio;
  final String? gender;
  final String country;
  final List<String> photos;

  /// 👤 Profile
  final String imageUrl;
  final File? imageFile;

  /// 📊 Social
  final List<String> followerIds;
  final List<String> followingIds;
  final int followers;
  final int following;
  final int likes;
  final List<BadgeModel> badges;

  /// 🟢 Presence
  final bool isOnline;
  final DateTime? lastSeen;
  //final DateTime createdAt;

  /// 💰 Economy
  final int coins;

  /// 🎥 Live
  final bool isLive;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.age,
    required this.bio,
    required this.gender,
    required this.country,
    required this.imageUrl,
    //required this.createdAt,
    this.imageFile,
    this.followers = 0,
    this.following = 0,
    this.followerIds = const [],
    this.followingIds = const [],
    this.badges = const [
      BadgeModel(imageUrl: "assets/images/streamer1.jpg", label: "Lv 15"),
      BadgeModel(imageUrl: "assets/images/streamer1.jpg", label: "Lv 12"),
    ],
    this.photos = const [
      "assets/images/stream1.jpg",
      "assets/images/stream2.jpg",
      "assets/images/stream3.jpg",
      "assets/images/stream4.jpg",
      "assets/images/streamer1.jpg",
      "assets/images/streamer1.jpg",
      "assets/images/streamer1.jpg",
      "assets/images/streamer1.jpg",
      "assets/images/streamer1.jpg",
      "assets/images/streamer1.jpg",
    ],
    this.likes = 0,
    this.isOnline = false,
    this.lastSeen,
    this.coins = 0,
    this.isLive = false,
  });

  /// 🔁 CopyWith (VERY IMPORTANT)
  UserModel copyWith({
    String? id,
    String? name,
    String? username,
    String? email,
    int? age,
    String? bio,
    String? gender,
    String? country,
    String? imageUrl,
    File? imageFile,
    int? followers,
    int? following,
    List<String>? followerIds,
    List<String>? followingIds,
    int? likes,
    bool? isOnline,
    DateTime? lastSeen,
    int? coins,
    bool? isLive,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      age: age ?? this.age,
      bio: bio ?? this.bio,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      imageUrl: imageUrl ?? this.imageUrl,
      imageFile: imageFile ?? this.imageFile,
      followerIds: followerIds ?? this.followerIds,
      followingIds: followingIds ?? this.followingIds,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      likes: likes ?? this.likes,
      isOnline: isOnline ?? this.isOnline,
      lastSeen: lastSeen ?? this.lastSeen,
      coins: coins ?? this.coins,
      isLive: isLive ?? this.isLive,
    );
  }

  UserModel addFollower(String id) {
  return copyWith(
    followerIds: [...followerIds, id],
    followers: followers + 1,
  );
}

  UserModel addFollowing(String id) {
  return copyWith(
    followingIds: [...followingIds, id],
    following: following + 1,
  );
  }

  bool isFollowing(String currentUserId) {
    return followerIds.contains(currentUserId);
  }


  /// 🔄 JSON (for backend later)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      age: json['age'],
      bio: json['bio'],
      gender: json['gender'],
      country: json['country'],
      imageUrl: json['imageUrl'],
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
      likes: json['likes'] ?? 0,
      isOnline: json['isOnline'] ?? false,
      lastSeen: json['lastSeen'] != null
          ? DateTime.parse(json['lastSeen'])
          : null,
      coins: json['coins'] ?? 0,
      isLive: json['isLive'] ?? false,
      photos: List<String>.from(
        json['photos'] ?? [],
      ),
      followerIds: List<String>.from(
        json['followerIds'] ?? [],
      ),
      followingIds: List<String>.from(
        json['followingIds'] ?? [],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'age': age,
      'bio': bio,
      'gender': gender,
      'country': country,
      'imageUrl': imageUrl,
      'followers': followers,
      'following': following,
      'likes': likes,
      'isOnline': isOnline,
      'lastSeen': lastSeen?.toIso8601String(),
      'coins': coins,
      'isLive': isLive,
      'photos': photos,
      'followerIds': followerIds,
      'followingIds': followingIds,
    };
  }
}
