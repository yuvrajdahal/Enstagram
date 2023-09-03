import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramclone/core/shared/constants.dart';
import 'package:instagramclone/main/presentations/profile/presentations/widgets/header_widget.dart';
import 'package:instagramclone/main/presentations/profile/presentations/widgets/user_info_widgets.dart';
import 'package:instagramclone/main/presentations/profile/shared/providers.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      ref.read(profileNotifierProvider.notifier).loadUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileNotifier = ref.watch(profileNotifierProvider);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  paddingValue,
                  paddingValue,
                  paddingValue,
                  paddingValue,
                ),
                child: const ProfileHeader(),
              ),
              SizedBox(
                height: paddingValue,
              ),
              UserInfo(user: profileNotifier.user),
            ],
          ),
        ),
      ),
    );
  }
}
