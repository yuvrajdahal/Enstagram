import 'package:flutter/material.dart';
import 'package:instagramclone/core/presentations/widgets/avtar_widgets.dart';
import 'package:instagramclone/core/shared/constants.dart';
import 'package:instagramclone/main/presentations/home-feed/domain/post_model.dart';

class Post extends StatefulWidget {
  final PostItem post;
  const Post({
    super.key,
    required this.post,
  });

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingValue),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Avatar(
                    radius: 40,
                    src: 'assets/images/yuvraj.jpeg',
                    isAsset: true,
                    showBorder: false,
                    colors: [
                      Color.fromARGB(255, 252, 92, 92),
                      Color.fromARGB(255, 227, 93, 93),
                      Color(0xFFFCAF45),
                      Color.fromARGB(166, 131, 58, 180),
                    ],
                  ),
                  const SizedBox(
                    width: paddingValue,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.post.username ?? "@insta_user",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        width: paddingValue - 2,
                      ),
                      const Icon(
                        Icons.verified,
                        size: 13,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.more_vert,
                size: 20,
                color: Colors.black54,
              )
            ],
          ),
        ),
        const SizedBox(
          height: paddingValue,
        ),
        const SizedBox(
          height: 300,
          child: Image(
            image: AssetImage('assets/images/dummy-2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingValue),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                      print(isLiked);
                    },
                    icon: isLiked == true
                        ? const Icon(
                            Icons.favorite,
                            size: 26,
                            color: Colors.pinkAccent,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            size: 26,
                          ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chat_bubble_outline_outlined,
                      size: 26,
                    ),
                  ),
                  Transform.rotate(
                    angle: 270 * 3.14,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send_outlined,
                        size: 26,
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_border,
                  size: 26,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
