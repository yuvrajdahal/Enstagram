import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramclone/main/presentations/home-feed/domain/post_model.dart';
import 'package:instagramclone/main/presentations/home-feed/infrastructures/posts_service.dart';

class PostsDataNotifier extends StateNotifier<PostsData> {
  final PostsService _service;

  PostsDataNotifier(this._service) : super(PostsData(data: [])) {
    // Fetch data on initialization
    log('fetching');
    fetchData();
  }
  Future<void> fetchData() async {
    try {
      final data = await _service.getPosts();
      log('data ${data.data.toString()}');
      state = state.copyWith(data: data.data);
    } catch (e) {
      throw Exception();
    }
  }
}

final postsServiceProvider = Provider<PostsService>((ref) {
  return PostsService();
});

final postsDataNotifierProvider =
    StateNotifierProvider<PostsDataNotifier, PostsData>((ref) {
  final postsService = ref.watch(postsServiceProvider);
  return PostsDataNotifier(postsService);
});
