import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tok/provider/room_data_provider.dart';
import 'package:tic_tok/resources/socket_methods.dart';

class TicTacToeBoard extends StatefulWidget {
  const TicTacToeBoard({super.key});

  @override
  State<TicTacToeBoard> createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.tappedListener(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    RoomDataProvider roomDataProvider =
        Provider.of<RoomDataProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AbsorbPointer(
        absorbing: roomDataProvider.roomData['turn']['socketID'] !=
            _socketMethods.socketClient.id,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: size.height * 0.7,
            maxWidth: 500,
          ),
          child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => tapped(index, roomDataProvider),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Center(
                    child: AnimatedSize(
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        roomDataProvider.displayElements[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 100,
                            shadows: [
                              Shadow(
                                blurRadius: 40,
                                color:
                                    roomDataProvider.displayElements[index] == 'O'
                                        ? Colors.red
                                        : Colors.blue,
                              )
                            ]),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void tapped(int index, RoomDataProvider roomDataProvider) {
    _socketMethods.tapGrid(
      index,
      roomDataProvider.roomData['_id'],
      roomDataProvider.displayElements,
    );
  }
}
