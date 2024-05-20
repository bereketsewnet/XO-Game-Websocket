import 'package:flutter/material.dart';

import '../responsive/responsive.dart';
import '../utils/colors.dart';
import '../widgets/coustom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfiled.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gameIdController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _gameIdController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                data: 'Join Room',
                fontSize: 70,
                shadows: [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.blue,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextField(
                controller: _nameController,
                hintText: 'Enter you nickname',
              ),
              SizedBox(height: size.height * 0.045),
              CustomTextField(
                controller: _gameIdController,
                hintText: 'Enter Game Id',
              ),
             const SizedBox(height: 20),
              CustomButton(onTap: (){}, text: 'Join'),
            ],
          ),
        ),
      ),
    );
  }
}
