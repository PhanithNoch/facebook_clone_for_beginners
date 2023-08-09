import 'package:facebook_clone/constant.dart';
import 'package:facebook_clone/models/post_data.dart';
import 'package:facebook_clone/screens/widgets/newsfeed_app_bar.dart';
import 'package:facebook_clone/screens/widgets/post_reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photo_view/photo_view.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            NewsFeedAppBar(),
          ];
        },
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
