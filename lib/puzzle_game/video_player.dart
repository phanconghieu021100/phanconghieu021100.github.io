import 'package:flutter/material.dart';
import 'package:puzzel/puzzle_game/rule_game.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerFromAsset extends StatefulWidget {
  @override
  _VideoPlayerFromAssetState createState() => _VideoPlayerFromAssetState();
}

class _VideoPlayerFromAssetState extends State<VideoPlayerFromAsset> {
  late VideoPlayerController _controller;
  bool hasPlayedOnce = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/gif_g2.mp4')
      ..initialize().then((_) {
        setState(() {}); // Cập nhật UI khi video sẵn sàng
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void handleButtonPress() {
    if (!hasPlayedOnce) {
      // 🔁 Lần đầu tiên nhấn → chạy video
      setState(() {
        _controller.play();
        hasPlayedOnce = true;
      });
    } else {
      // ⏩ Lần tiếp theo → chuyển trang
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RuleGame()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleButtonPress,
        child: Icon(
          hasPlayedOnce ? Icons.arrow_forward_ios_rounded : Icons.play_arrow,
        ),
      ),
    );
  }
}
