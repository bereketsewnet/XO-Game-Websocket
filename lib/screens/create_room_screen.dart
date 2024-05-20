import 'package:flutter/material.dart';
import 'package:tic_tok/responsive/responsive.dart';
import 'package:tic_tok/utils/colors.dart';
import 'package:tic_tok/widgets/coustom_button.dart';
import 'package:tic_tok/widgets/custom_text.dart';
import 'package:tic_tok/widgets/custom_textfiled.dart';

import '../resources/socket_methods.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';

  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  void initState() {
    super.initState();
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
                data: 'Create Room',
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
              CustomButton(
                onTap: () {
                  _socketMethods.createRoom(
                    _nameController.text,
                  );
                },
                text: 'Create',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
