import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioPlayerService {
  final AudioPlayer _player = AudioPlayer();

  Future<bool> _requestAudioPermission() async {
    if (!Platform.isAndroid) return true;

    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    final sdkInt = androidInfo.version.sdkInt;

    if (sdkInt >= 33) {
      final status = await Permission.audio.request();
      return status.isGranted;
    } else {
      final status = await Permission.storage.request();
      return status.isGranted;
    }
  }

  // Future<void> play() async {
  //   // await _player.setAsset('assets/audio/test.wav');
  //   // await _player.setUrl(
  //   //   'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
  //   // );

  //   await _player.setFilePath('/storage/emulated/0/Music/song_app.mp3');
  //   _player.play();
  // }

  Future<void> playLocalMp3() async {
    final hasPermission = await _requestAudioPermission();

    if (!hasPermission) {
      print('Permission Denied !!!');
      return;
    }

    // final status = await Permission.storage.request();

    // if (!status.isGranted) {
    //   print('Permission denied');
    //   return;
    // }

    await _player.setFilePath('/storage/emulated/0/Music/song_app.mp3');
    _player.play();
  }
}
