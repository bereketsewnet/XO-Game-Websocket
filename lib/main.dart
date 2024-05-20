import 'package:flutter/material.dart';
import 'package:tic_tok/screens/create_room_screen.dart';
import 'package:tic_tok/screens/join_room_screen.dart';
import 'package:tic_tok/screens/main_menu_screen.dart';
import 'package:tic_tok/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        backgroundColor: bgColor,
      ),
      routes: {
        MainMenuScreen.routeName : (context) => const MainMenuScreen(),
        JoinRoomScreen.routeName : (context) => const JoinRoomScreen(),
        CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
      },
      initialRoute: MainMenuScreen.routeName,
    );
  }
}

