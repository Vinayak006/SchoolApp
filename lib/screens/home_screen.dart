import 'package:flutter/material.dart';
import '../custom_painter.dart';
import '../data.dart';
import '../widgets/teacher_card.dart';
import '../widgets/activity_card.dart';
import 'chat.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  CustomPaint(
                    painter: HomePaint(),
                    child: Container(
                      width: width,
                    ),
                  ),
                  Positioned(
                    top: height * 0.13,
                    left: width * 0.06,
                    width: width,
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Hello,\n\n",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          TextSpan(
                            text: "Ajith",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: height * 0.04,
                    // left: width * 0.08,
                    width: width,
                    height: height * 0.2,
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(left: 20),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int index) {
                        return Activity(
                          activity: activityInfo[index]["activity"],
                          progress: activityInfo[index]["progress"],
                          icon: activityInfo[index]["icon"],
                          color: activityInfo[index]["color"],
                          paint: activityInfo[index]["paint"],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: width * 0.05,
                        );
                      },
                      itemCount: activityInfo.length,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Teachers",
                            style: TextStyle(
                              color: Color.fromARGB(255, 18, 83, 135),
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "See All",
                              style: TextStyle(
                                color: Color.fromARGB(255, 18, 83, 135),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.2,
                      child: ListView.separated(
                        padding: const EdgeInsets.only(left: 20),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, int index) {
                          return GestureDetector(
                            onTap: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) {
                                    return Chat(
                                      name: teachersInfo[index]["name"],
                                      image: teachersInfo[index]["image"],
                                    );
                                  }),
                                ),
                              );
                            }),
                            child: Teacher(
                              name: teachersInfo[index]["name"],
                              profession: teachersInfo[index]["profession"],
                              color: teachersInfo[index]["color"],
                              rating: teachersInfo[index]["rating"],
                              image: teachersInfo[index]["image"],
                            ),
                          );
                        },
                        separatorBuilder: ((context, index) {
                          return SizedBox(
                            width: width * 0.07,
                          );
                        }),
                        itemCount: teachersInfo.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
