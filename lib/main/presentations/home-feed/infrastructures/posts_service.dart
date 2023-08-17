import 'dart:developer';

import 'package:instagramclone/main/presentations/home-feed/domain/post_model.dart';

class PostsService {
  Future<PostsData> getPosts() async {
    try {
      final items = Iterable.generate(5)
          .map((doc) =>
              PostItem(id: "1", createdAt: "", src: "", username: "yuvraj"))
          .toList();
      final postsData = PostsData(data: items);
      return postsData;
    } catch (e) {
      log('Error: $e');
      throw Exception(); // General server error
    }
  }
}
