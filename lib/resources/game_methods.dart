import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tic_tok/provider/room_data_provider.dart';

import '../utils/utils.dart';

class GameMethods {
  void checkWinner(BuildContext context, Socket socketClient) {
    RoomDataProvider roomDataProvider =
        Provider.of<RoomDataProvider>(context, listen: false);

    String winner = '';
    // this condition for winner for Row
    // 1st row | 2nd row | 3rd row

    if (roomDataProvider.displayElements[0] != '' &&
        roomDataProvider.displayElements[0] ==
            roomDataProvider.displayElements[1] &&
        roomDataProvider.displayElements[0] ==
            roomDataProvider.displayElements[2]) {
      // set the string x or 0 is the winner by using compare to 0 index
      winner = roomDataProvider.displayElements[0];
    }

    if (roomDataProvider.displayElements[3] != '' &&
        roomDataProvider.displayElements[3] ==
            roomDataProvider.displayElements[4] &&
        roomDataProvider.displayElements[3] ==
            roomDataProvider.displayElements[5]) {
      // set the string x or 0 is the winner by using compare to 3 index
      winner = roomDataProvider.displayElements[3];
    }

    if (roomDataProvider.displayElements[6] != '' &&
        roomDataProvider.displayElements[6] ==
            roomDataProvider.displayElements[7] &&
        roomDataProvider.displayElements[6] ==
            roomDataProvider.displayElements[8]) {
      // set the string x or 0 is the winner by using compare to 6 index
      winner = roomDataProvider.displayElements[6];
    }
    // finish Row condition

    // this condition for winner for Column
    // 1st column | 2nd column | 3rd column

    if (roomDataProvider.displayElements[0] != '' &&
        roomDataProvider.displayElements[0] ==
            roomDataProvider.displayElements[3] &&
        roomDataProvider.displayElements[0] ==
            roomDataProvider.displayElements[6]) {
      // set the string x or 0 is the winner by using compare to 0 index
      winner = roomDataProvider.displayElements[0];
    }

    if (roomDataProvider.displayElements[1] != '' &&
        roomDataProvider.displayElements[1] ==
            roomDataProvider.displayElements[4] &&
        roomDataProvider.displayElements[1] ==
            roomDataProvider.displayElements[7]) {
      // set the string x or 0 is the winner by using compare to 1 index
      winner = roomDataProvider.displayElements[1];
    }

    if (roomDataProvider.displayElements[2] != '' &&
        roomDataProvider.displayElements[2] ==
            roomDataProvider.displayElements[5] &&
        roomDataProvider.displayElements[2] ==
            roomDataProvider.displayElements[8]) {
      // set the string x or 0 is the winner by using compare to 2 index
      winner = roomDataProvider.displayElements[2];
    }
    // finish Row condition

    // this condition for winner for cross
    // 1st cross | 2nd cross

    if (roomDataProvider.displayElements[0] != '' &&
        roomDataProvider.displayElements[0] ==
            roomDataProvider.displayElements[4] &&
        roomDataProvider.displayElements[0] ==
            roomDataProvider.displayElements[8]) {
      // set the string x or 0 is the winner by using compare to 0 index
      winner = roomDataProvider.displayElements[0];
    }

    if (roomDataProvider.displayElements[2] != '' &&
        roomDataProvider.displayElements[2] ==
            roomDataProvider.displayElements[4] &&
        roomDataProvider.displayElements[2] ==
            roomDataProvider.displayElements[6]) {
      // set the string x or 0 is the winner by using compare to 2 index
      winner = roomDataProvider.displayElements[2];
    }

    if(roomDataProvider.filledBoxes == 9) {
      winner = '';
      // display game dialog box saying draw
      showGameDialog(context, 'Draw');
    }

    // finish cross condition

    if (winner != '') {
      if (roomDataProvider.player1.playerType == winner) {
        showGameDialog(context, '${roomDataProvider.player1.nickname} won!');
        socketClient.emit('winner', {
          'winnerSocketId': roomDataProvider.player1.socketID,
          'roomId': roomDataProvider.roomData['_id'],
        });
      } else {
        showGameDialog(context, '${roomDataProvider.player2.nickname} won!');
        socketClient.emit('winner', {
          'winnerSocketId': roomDataProvider.player2.socketID,
          'roomId': roomDataProvider.roomData['_id'],
        });
      }
    }
  }

  void clearBoard(BuildContext context) {
    RoomDataProvider roomDataProvider =
    Provider.of<RoomDataProvider>(context, listen: false);

    for (int i = 0; i < roomDataProvider.displayElements.length; i++) {
      roomDataProvider.updateDisplayElements(i, '');
    }
    roomDataProvider.setFilledBoxesTo0();
  }

}
