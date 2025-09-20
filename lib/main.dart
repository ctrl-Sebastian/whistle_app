import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const WhistleApp());
}

class WhistleApp extends StatefulWidget {
  const WhistleApp({super.key});

  @override
  State<WhistleApp> createState() => _WhistleAppState();
}

class _WhistleAppState extends State<WhistleApp> {
  final audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    Future<void> playSound({
      required AudioPlayer audioPlayer,
      required String soundFile,
    }) async {
      await audioPlayer.stop();
      await audioPlayer.setVolume(1.0);
      await audioPlayer.play(AssetSource(soundFile));
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown[400],
        appBar: AppBar(
          title: Text(
            "Whistle App",
            style: TextStyle(color: Colors.yellow[600]),
          ),
          backgroundColor: Colors.brown[700],
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.volume_up_rounded,
                  size: 200.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  playSound(
                    audioPlayer: audioPlayer,
                    soundFile: "sounds/buzzer.mp3",
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.pets, size: 200.0, color: Colors.white),
                onPressed: () {
                  playSound(
                    audioPlayer: audioPlayer,
                    soundFile: "sounds/funny_cat_sound.mp3",
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.sports, size: 200.0, color: Colors.white),
                onPressed: () {
                  playSound(
                    audioPlayer: audioPlayer,
                    soundFile: "sounds/referee_whistle.mp3",
                  );
                },
              ),
              Text(
                "Tap an icon to play a sound!",
                style: TextStyle(
                  color: Colors.yellow[600],
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Done with ❤️ by Sebastian De Leon",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
