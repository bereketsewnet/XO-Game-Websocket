import 'package:flutter/material.dart';
import 'package:tic_tok/responsive/responsive.dart';
import 'package:tic_tok/screens/create_room_screen.dart';
import 'package:tic_tok/screens/join_room_screen.dart';
import 'package:tic_tok/widgets/coustom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, CreateRoomScreen.routeName);
              },
              text: 'Create Room',
            ),
            const SizedBox(height: 20),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, JoinRoomScreen.routeName);
              },
              text: 'Join Room',
            ),
          ],
        ),
      ),
    );
  }
}
