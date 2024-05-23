import 'package:flutter/material.dart';
import 'package:tic_tok/responsive/responsive.dart';
import 'package:tic_tok/screens/create_room_screen.dart';
import 'package:tic_tok/screens/join_room_screen.dart';
import 'package:tic_tok/utils/colors.dart';
import 'package:tic_tok/widgets/coustom_button.dart';
import 'package:tic_tok/widgets/custom_text.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';

  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'X',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                          color: Colors.blue,
                          blurRadius: 15,
                          spreadRadius: 20,
                        ),
                      ],
                    ),
                  ),
                  TextSpan(
                    text: 'O',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                          color: Colors.red,
                          blurRadius: 15,
                          spreadRadius: 20,
                        ),
                      ],
                    ),
                  ),
                  TextSpan(
                    text: ' Fun',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                          color: Colors.blue,
                          blurRadius: 15,
                          spreadRadius: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, CreateRoomScreen.routeName);
                },
                text: 'Create Room',
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, JoinRoomScreen.routeName);
                },
                text: 'Join Room',
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: ' ... ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                          color: Colors.blue,
                          blurRadius: 15,
                          spreadRadius: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
