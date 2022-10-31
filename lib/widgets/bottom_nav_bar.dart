import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class BottomNavBar extends StatefulWidget {
  final int screenIndex;
  final Function setScreenIndex;
  const BottomNavBar(this.screenIndex, this.setScreenIndex, {super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return NavigationBarTheme(
      data: const NavigationBarThemeData(
        labelTextStyle: MaterialStatePropertyAll(
          TextStyle(
            color: Color.fromARGB(255, 18, 83, 135),
            fontSize: 13,
          ),
        ),
        iconTheme: MaterialStatePropertyAll(
          IconThemeData(
            size: 28,
          ),
        ),
        indicatorColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: NavigationBar(
            backgroundColor: Colors.white,
            animationDuration: const Duration(milliseconds: 800),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            height: height * 0.09,
            selectedIndex: widget.screenIndex,
            onDestinationSelected: (int newIndex) {
              widget.setScreenIndex(newIndex);
            },
            destinations: [
              NavigationDestination(
                selectedIcon: const Icon(
                  Icons.home_max_rounded,
                  color: Color.fromARGB(255, 18, 83, 135),
                  size: 30,
                ),
                label: 'Home',
                icon: Icon(
                  Icons.home_max_rounded,
                  color: const Color.fromARGB(255, 18, 83, 135).withOpacity(.5),
                ),
              ),
              NavigationDestination(
                selectedIcon: const Icon(
                  Icons.calendar_today_outlined,
                  color: Color.fromARGB(255, 18, 83, 135),
                ),
                label: 'Calendar',
                icon: Icon(
                  Icons.calendar_today_outlined,
                  color: const Color.fromARGB(255, 18, 83, 135).withOpacity(.5),
                ),
              ),
              NavigationDestination(
                selectedIcon: const Icon(
                  Icons.chat_bubble_outline_outlined,
                  color: Color.fromARGB(255, 18, 83, 135),
                ),
                label: 'Chat',
                icon: Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: const Color.fromARGB(255, 18, 83, 135).withOpacity(.5),
                ),
              ),
              NavigationDestination(
                selectedIcon: const Icon(
                  Icons.person_outline_outlined,
                  color: Color.fromARGB(255, 18, 83, 135),
                ),
                label: 'Account',
                icon: Icon(
                  Icons.person_outline_rounded,
                  color: const Color.fromARGB(255, 18, 83, 135).withOpacity(.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
