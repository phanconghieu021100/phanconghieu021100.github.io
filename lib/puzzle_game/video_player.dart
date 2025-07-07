import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puzzel/puzzle_game/rule_game.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerFromAsset extends StatefulWidget {
  @override
  _VideoPlayerFromAssetState createState() => _VideoPlayerFromAssetState();
}

class _VideoPlayerFromAssetState extends State<VideoPlayerFromAsset> {
  late VideoPlayerController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.asset('assets/images/start_mp4.mp4')
  //     ..initialize().then((_) {
  //       setState(() {}); // Cập nhật UI khi video đã sẵn sàng
  //     });
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RuleGame(),
                  ),
                );
              },
              child: Image.asset('assets/images/img1.png', fit: BoxFit.cover))),
      // Center(
      //   child: _controller.value.isInitialized
      //       ? GestureDetector(
      //           onTap: () {
      //             setState(() {
      //               _controller.value.isPlaying
      //                   ? _controller.pause()
      //                   : _controller.play();
      //             });
      //           },
      //           child: AspectRatio(
      //             aspectRatio: _controller.value.aspectRatio,
      //             child: VideoPlayer(_controller),
      //           ),
      //         )
      //       : CircularProgressIndicator(),
      // ),
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () {
      //         setState(() {
      //           _controller.value.isPlaying
      //               ? _controller.pause()
      //               : _controller.play();
      //         });
      //       },
      //       child: Icon(
      //           _controller.value.isPlaying ? Icons.play_arrow : Icons.stop),
      //     ),
      //     SizedBox(
      //       height: 5.h,
      //     ),
      //     FloatingActionButton(
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => RuleGame(),
      //           ),
      //         );
      //       },
      //       child: Icon(Icons.arrow_forward_ios_rounded),
      //     ),
      //   ],
      // ),
    );
  }
}
