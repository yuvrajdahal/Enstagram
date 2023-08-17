import 'package:instagramclone/login/presentations/login_page.dart';
import 'package:instagramclone/main/presentations/add-post/add_post_page.dart';
import 'package:instagramclone/main/presentations/main_page.dart';
import 'package:instagramclone/splash/presentations/splash_page.dart';
import 'package:instagramclone/main/presentations/home-feed/presentations/home_feed_page.dart';
import 'package:instagramclone/main/presentations/profile/presentations/profile_page.dart';
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page),
        AutoRoute(page: LoginRoute.page, path: '/'),
        AutoRoute(
          page: MainRoute.page,
          path: "/main",
          children: [
            AutoRoute(path: 'home', page: HomeFeedRoute.page),
            AutoRoute(path: 'profile', page: ProfileRoute.page),
            AutoRoute(path: 'add_post', page: AddPostRoute.page),
          ],
        ),
      ];
}
