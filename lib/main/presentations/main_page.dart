import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instagramclone/core/presentations/routes/app_router.dart';
import 'package:instagramclone/core/presentations/widgets/avtar_widgets.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [HomeFeedRoute(), AddPostRoute(), ProfileRoute()],
      bottomNavigationBuilder: (_, tabsRouter) {
        final activeIndex = tabsRouter.activeIndex;

        // return BottomBar(activeIndex: activeIndex);
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Color.fromARGB(255, 219, 219, 219)),
            ),
          ),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  tabsRouter.setActiveIndex(0);
                },
                icon: activeIndex == 0
                    ? const Icon(
                        Icons.home,
                        size: 30,
                      )
                    : const Icon(
                        Icons.home_outlined,
                        size: 30,
                      ),
              ),
              IconButton(
                onPressed: () {
                  tabsRouter.setActiveIndex(1);
                },
                icon: activeIndex == 0
                    ? const Icon(
                        FontAwesomeIcons.instagram,
                        size: 30,
                      )
                    : const Icon(
                        FontAwesomeIcons.instagram,
                        size: 30,
                      ),
              ),
              GestureDetector(
                onTap: () {
                  tabsRouter.setActiveIndex(2);
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: activeIndex == 2 ? 2 : 0)),
                  child: const Avatar(
                    radius: 30,
                    showBorder: false,
                    src: 'assets/images/yuvraj.jpeg',
                    isAsset: true,
                    colors: [
                      Color.fromARGB(255, 252, 92, 92),
                      Color.fromARGB(255, 227, 93, 93),
                      Color(0xFFFCAF45),
                      Color.fromARGB(166, 131, 58, 180),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
