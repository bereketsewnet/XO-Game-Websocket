import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tok/provider/room_data_provider.dart';
import 'package:tic_tok/resources/socket_methods.dart';
import 'package:tic_tok/widgets/scoreboard.dart';
import 'package:tic_tok/widgets/waiting_lobby.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';

  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context, listen: true);
    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : const SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Scoreboard(),
                  // const TicTacToeBoard(),
                  // Text(
                  //     '${roomDataProvider.roomData['turn']['nickname']}\'s turn'),
                ],
              ),
            ),
    );
  }
}
