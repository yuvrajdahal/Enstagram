import 'package:flutter/material.dart';
import 'package:instagramclone/core/domain/user.dart';
import 'package:instagramclone/core/presentations/widgets/avtar_widgets.dart';
import 'package:instagramclone/core/shared/constants.dart';

class UserInfo extends StatelessWidget {
  final User? user;
  const UserInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          paddingValue * 2, paddingValue, paddingValue, paddingValue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Avatar(
                radius: 80,
                showBorder: false,
                src: user?.profilePicture ?? "",
                isAsset: false,
                colors: const [
                  Color.fromARGB(255, 252, 92, 92),
                  Color.fromARGB(255, 227, 93, 93),
                  Color(0xFFFCAF45),
                  Color.fromARGB(166, 131, 58, 180),
                ],
              ),
              const SizedBox(width: paddingValue * 4),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "5",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Posts",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "1M+",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Followers",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "2",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Following",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                user?.email ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.apply(fontWeightDelta: 1),
              ),
              const SizedBox(height: 3),
              Text(
                "Tech Enthuaist | Tech Consisuneer",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: paddingValue),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey.shade100,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Edit Profile",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  const SizedBox(width: paddingValue),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey.shade100,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Share Profile",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  const SizedBox(width: paddingValue),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey.shade100,
                      ),
                      onPressed: () async {},
                      child: const Icon(Icons.person_add_alt_1_outlined)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
