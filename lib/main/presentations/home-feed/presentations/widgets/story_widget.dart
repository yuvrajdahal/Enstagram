import 'package:flutter/material.dart';
import 'package:instagramclone/core/presentations/widgets/avtar_widgets.dart';
import 'package:instagramclone/core/shared/constants.dart';

class StoryWidget extends StatelessWidget {
  final List list;
  const StoryWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: paddingValue + 2,
              ),
              itemBuilder: (context, index) {
                final item = list[index];
                return Row(
                  children: [
                    if (index == 0)
                      Row(
                        children: [
                          Column(
                            children: [
                              Stack(
                                children: [
                                  const Avatar(
                                    radius: 80,
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
                                  Positioned(
                                    bottom: 5,
                                    right: 5,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade600,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                        )),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Center(
                                child: Text("Add story",
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                              )
                            ],
                          ),
                          const SizedBox(width: paddingValue + 2),
                        ],
                      ),
                    Column(
                      children: [
                        const Avatar(
                          radius: 80,
                          src: "",
                          colors: [
                            Color.fromARGB(255, 252, 92, 92),
                            Color.fromARGB(255, 227, 93, 93),
                            Color(0xFFFCAF45),
                            Color.fromARGB(75, 131, 58, 180),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: Text(
                            item['name'].toString(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
