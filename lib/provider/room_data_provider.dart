import 'package:flutter/material.dart';
import 'package:tic_tok/models/player.dart';

class RoomDataProvider extends ChangeNotifier {
  Map<String, dynamic> _roomData = {};
  List<String> _displayElement = ['', '', '', '', '', '', '', '', ''];
  int _filledBoxes = 0;
  Player _player1 = Player(
    nickname: '',
    socketID: '',
    points: 0,
    playerType: 'X',
  );

  Player _player2 = Player(
    nickname: '',
    socketID: '',
    points: 0,
    playerType: 'O',
  );

  // to get the value to this create getter methods
  Map<String, dynamic> get roomData => _roomData;
  List<String> get displayElements => _displayElement;
  int get filledBoxes => _filledBoxes;
  Player get player1 => _player1;
  Player get player2 => _player2;

  // to update the game room which two player play on
  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners();
  }

  // to update only player1 data
  void updatePlayer1(Map<String, dynamic> player1Data) {
    _player1 = Player.fromMap(player1Data);
    notifyListeners();
  }

  // to update only player2 data
  void updatePlayer2(Map<String, dynamic> player2Data) {
    _player2 = Player.fromMap(player2Data);
    notifyListeners();
  }

  // to update the list of string that we have choice
  void updateDisplayElements(int index, String choice) {
    _displayElement[index] = choice;
    _filledBoxes += 1;
    notifyListeners();
  }

  // fill box 0
 void setFilledBoxesTo0() {
    _filledBoxes = 0;
    notifyListeners();
 }
}
