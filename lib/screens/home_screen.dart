import 'package:facebook_clone/constant.dart';
import 'package:facebook_clone/screens/new_feed_screen.dart';
import 'package:facebook_clone/screens/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Facebook',
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            actions: [
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.search,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.facebookMessenger,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "2",
                          style: TextStyle(fontSize: 9),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
            bottom: const TabBar(
              indicatorColor: kPrimaryColor,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.ondemand_video,
                    color: Colors.grey,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.group,
                    color: Colors.grey,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.grey,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              NewsFeedScreen(),
              VideoScreen(),
              Container(
                child: Text('Group'),
              ),
              Container(
                child: Text('Notification'),
              ),
              Container(
                child: Text('Menu'),
              ),
            ],
          )),
    );
  }
}
