import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:video_player/video_player.dart';

class PostReusableWidget extends StatefulWidget {
  const PostReusableWidget({
    super.key,
    required this.profileUrl,
    required this.userName,
    required this.postTime,
    required this.caption,
    required this.photoUrl,
    this.isVideo = false,
    this.controller,
  });
  final String profileUrl;
  final String userName;
  final String postTime;
  final String caption;
  final String photoUrl;
  final bool? isVideo;
  final VideoPlayerController? controller;

  @override
  State<PostReusableWidget> createState() => _PostReusableWidgetState();
}

class _PostReusableWidgetState extends State<PostReusableWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// post header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "${widget.photoUrl}",
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${widget.userName}"),
                      Row(
                        children: [
                          Text("${widget.postTime}"),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.public,
                            size: 15,
                          )
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text("${widget.caption}"),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        widget.isVideo == false
            ? GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Stack(
                        children: [
                          PhotoView(
                            imageProvider: NetworkImage("${widget.photoUrl}"),
                          ),
                          SafeArea(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                child: Image.network(
                  "${widget.photoUrl}",
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              )
            : widget.controller!.value.isInitialized
                ? Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: widget.controller!.value.aspectRatio,
                        child: VideoPlayer(widget.controller!),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        bottom: 0,
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              widget.controller!.value.isPlaying
                                  ? widget.controller!.pause()
                                  : widget.controller!.play();
                              setState(() {});
                            },
                            icon: Icon(
                              widget.controller!.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey.withOpacity(0.4),
                    child: Center(
                      child: Icon(Icons.play_arrow),
                    ),
                  ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                "😠",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "1",
              ),
              Spacer(),
              Text(
                "4 Comment",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.thumb_up),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Like"),
                ],
              ),
              style: TextButton.styleFrom(
                primary: Colors.grey,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.grey,
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.comment),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Comment"),
                ],
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.grey,
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.share),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Share"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
