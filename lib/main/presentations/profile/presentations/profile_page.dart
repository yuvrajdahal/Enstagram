import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instagramclone/core/shared/constants.dart';
import 'package:instagramclone/main/presentations/profile/presentations/widgets/header_widget.dart';
import 'package:instagramclone/main/presentations/profile/presentations/widgets/user_info_widgets.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
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
                child: ProfileHeader(),
              ),
              SizedBox(
                height: paddingValue,
              ),
              UserInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
