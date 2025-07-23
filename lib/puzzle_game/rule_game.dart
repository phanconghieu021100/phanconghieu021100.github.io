import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puzzel/puzzle_game/crossword_puzzle.dart';
import 'package:video_player/video_player.dart';

class RuleGame extends StatefulWidget {
  @override
  _RuleGameState createState() => _RuleGameState();
}

class _RuleGameState extends State<RuleGame> {
  late VideoPlayerController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.asset('assets/images/rule_mp4.mp4')
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
                      builder: (context) => VietnameseCrosswordPuzzle(),
                    ),
                  );
                },
                child: Image.asset('assets/images/img2_g2.png',
                    fit: BoxFit.cover))),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VietnameseCrosswordPuzzle(),
                  ),
                );
              },
              child: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        )
        // Center(
        //   child: _controller.value.isInitialized
        //       ? AspectRatio(
        //           aspectRatio: _controller.value.aspectRatio,
        //           child: VideoPlayer(_controller),
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
        //             builder: (context) => VietnameseCrosswordPuzzle(),
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
