import 'package:flutter/material.dart';

import '../services/audio_player_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final audioService = AudioPlayerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tiburoncin MP3',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // audioService.play();
                audioService.playLocalMp3();
              },
              child: const Text('PLAY'),
            ),
            ElevatedButton(
              onPressed: () {
                // audioService.play();
                audioService.stopMp3();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text(
                'STOP',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
