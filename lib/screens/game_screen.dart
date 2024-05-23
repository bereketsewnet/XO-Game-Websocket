import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tok/provider/room_data_provider.dart';
import 'package:tic_tok/resources/socket_methods.dart';
import 'package:tic_tok/GameView/scoreboard.dart';
import 'package:tic_tok/GameView/waiting_lobby.dart';

import '../GameView/tictactoe_board.dart';
import '../utils/colors.dart';

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
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: bgColor,
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Scoreboard(),
                  const TicTacToeBoard(),
                  Text(
                      '${roomDataProvider.roomData['turn']['nickname']}\'s turn'),
                ],
              ),
            ),
    );
  }
}
