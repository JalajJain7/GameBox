// ignore_for_file: non_constant_identifier_names

var mainstorage = [];
var player1_storage = [];
var player2_storage = [];
bool chance = true;
bool player1_won = false;
bool player2_won = false;
var player1 = "Player 1";
var player2 = "Player 2";
void init() {
  mainstorage = [
    [for (var i = 35; i >= 0; i -= 7) i],
    [for (var i = 36; i >= 0; i -= 7) i],
    [for (var i = 37; i >= 0; i -= 7) i],
    [for (var i = 38; i >= 0; i -= 7) i],
    [for (var i = 39; i >= 0; i -= 7) i],
    [for (var i = 40; i >= 0; i -= 7) i],
    [for (var i = 41; i >= 0; i -= 7) i],
  ];
  player1_storage = [];
  player2_storage = [];
  chance = true;
  player1_won = false;
  player2_won = false;
  player1 = "Player 1";
  player2 = "Player 2";
}
