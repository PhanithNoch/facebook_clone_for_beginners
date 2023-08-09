import 'package:facebook_clone/models/post_data.dart';
import 'package:facebook_clone/screens/widgets/post_reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: PostReusableWidget(
                    profileUrl: posts[index].profileUrl,
                    userName: posts[index].userName,
                    postTime: posts[index].postTime,
                    caption: posts[index].caption,
                    photoUrl: posts[index].photoUrl,
                    isVideo: true,
                    controller: _controller,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
