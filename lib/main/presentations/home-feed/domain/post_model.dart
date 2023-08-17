class PostsData<PostItem> {
  final List<PostItem> data;

  PostsData({required this.data});
  PostsData copyWith({List<PostItem>? data}) {
    return PostsData(data: data ?? this.data);
  }
}

class PostItem {
  final String id;
  final String createdAt;
  final String src;
  final String? username;

  PostItem({
    required this.id,
    required this.src,
    required this.username,
    required this.createdAt,
  });
}
