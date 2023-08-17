import 'package:flutter/material.dart';
import 'package:instagramclone/main/presentations/home-feed/presentations/widgets/post_widget.dart';

class PostsWidget extends StatelessWidget {
  final List posts;
  const PostsWidget({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
                child: Divider(thickness: 0.8),
              ),
          scrollDirection: Axis.vertical,
          itemCount: posts.length,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Post(post: post);
          }),
    );
  }
}
