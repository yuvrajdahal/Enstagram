class User {
  final String email;
  final String id;
  final String profilePicture;
  final int followers;
  final int following;
  final int posts;

  User({
    required this.email,
    required this.id,
    required this.profilePicture,
    required this.followers,
    required this.following,
    required this.posts,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["_id"] ?? json["id"],
        email: json["email"],
        profilePicture: json['profilePicture'],
        followers: json["followers"],
        following: json["following"],
        posts: json["posts"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'id': id,
      'profilePicture': profilePicture,
      'followers': followers,
      'following': following,
      'posts': posts,
    };
  }
}
