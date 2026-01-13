import 'package:flutter/material.dart';

import '../services/audio_player_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final audioService = AudioPlayerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tiburoncin MP3')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Home Screen'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // audioService.play();
                audioService.playLocalMp3();
              },
              child: const Text('Play Local MP3'),
            ),
          ],
        ),
      ),
    );
  }
}
