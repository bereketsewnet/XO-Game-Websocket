import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tok/resources/socket_methods.dart';

import '../provider/room_data_provider.dart';
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
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _gameIdController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccurredListener(context);
    _socketMethods.updatePlayersStateListener(context);
    _socketMethods.gameCreatorJoinListener(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    RoomDataProvider roomDataProvider =
        Provider.of<RoomDataProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: bgColor,
      body: Responsive(
        child: SingleChildScrollView(
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
                SizedBox(height: size.height * 0.06),
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
                CustomButton(
                  onTap: () {
                    _socketMethods.joinRoom(
                      _nameController.text,
                      _gameIdController.text,
                    );
                  },
                  text: 'Join',
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.blue,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'On Air',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          shadows: [
                            BoxShadow(
                              color: Colors.blue,
                              spreadRadius: 0,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: size.height * 0.23,
                  decoration: const BoxDecoration(),
                  child: ListView.builder(
                    itemCount: roomDataProvider.gameCreatorList.length,
                    itemBuilder: (context, index) {
                      String nickname =
                          roomDataProvider.gameCreatorList[index]['nickname'];
                      String id =
                          roomDataProvider.gameCreatorList[index]['roomId'];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _gameIdController.text = id;
                          });
                        },
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.person,
                            ),
                          ),
                          title: Text(
                            nickname,
                          ),
                          subtitle: Text(
                            id,
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
