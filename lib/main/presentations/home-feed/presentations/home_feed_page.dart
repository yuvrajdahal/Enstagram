import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramclone/core/shared/constants.dart';
import 'package:instagramclone/main/presentations/home-feed/presentations/widgets/header_widget.dart';
import 'package:instagramclone/main/presentations/home-feed/presentations/widgets/posts_widget.dart';
import 'package:instagramclone/main/presentations/home-feed/presentations/widgets/story_widget.dart';
import 'package:instagramclone/main/presentations/home-feed/shared/providers.dart';

@RoutePage()
class HomeFeedPage extends ConsumerWidget {
  const HomeFeedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsState = ref.watch(postsDataNotifierProvider);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(
                  paddingValue,
                  paddingValue,
                  paddingValue,
                  paddingValue,
                ),
                child: Header(),
              ),
              const SizedBox(
                height: paddingValue,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  paddingValue,
                  paddingValue,
                  0,
                  paddingValue,
                ),
                child: StoryWidget(list: list),
              ),
              const Divider(thickness: 0.8),
              PostsWidget(posts: postsState.data)
            ],
          ),
        ),
      ),
    );
  }
}

final List list = [
  {
    "url": "https://media.herworld.com/public/2021/03/Blackpink-Lisa.jpg",
    'name': 'lisa1'
  },
  {
    "url":
        "https://assets.teenvogue.com/photos/618a8f892c843cb59d7b9633/16:9/w_2560%2Cc_limit/1300082199",
    'name': 'lisa2'
  },
  {
    "url":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIH1FxHtY5ItH7DJz4nPkbTzmY7f6u2VOSYA&usqp=CAU",
    'name': 'lisa3'
  },
  {
    "url":
        "https://e0.pxfuel.com/wallpapers/793/539/desktop-wallpaper-lisa-blackpink-iphone-x-iphone-lisa-the-best-lisa.jpg",
    'name': 'lisa4'
  },
  {
    "url":
        "https://e1.pxfuel.com/desktop-wallpaper/647/991/desktop-wallpaper-190-best-lisa-blackpink-ideas-lisa-mobile.jpg",
    'name': 'lisa5'
  },
  {
    "url":
        "https://www.edigitalagency.com.au/wp-content/uploads/new-Instagram-logo-png-full-colour-glyph.png",
    'name': 'lisa6'
  },
];
