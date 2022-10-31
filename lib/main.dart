import 'package:flutter/material.dart';
import 'package:school_app/screens/account.dart';
import 'package:school_app/screens/chat_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/home_screen.dart';
import 'widgets/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final screens = [
    const Home(),
    const CalendarScreen(),
    const ChatScreen(),
    const AccountScreen(),
  ];
  int screenIndex = 0;
  void setScreenIndex(index) {
    setState(() {
      screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[screenIndex],
      bottomNavigationBar: BottomNavBar(screenIndex, setScreenIndex),
    );
  }
}
