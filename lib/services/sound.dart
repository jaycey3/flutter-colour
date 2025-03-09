import 'package:audioplayers/audioplayers.dart';

void playSound(bool isMatch) {
  final player = AudioPlayer();
  String soundPath = isMatch ? 'assets/sounds/correct.mp3' : 'assets/sounds/wrong.mp3';
  player.play(AssetSource(soundPath));
}
