import 'package:facebook_clone/constant.dart';
import 'package:flutter/material.dart';

class NewsFeedAppBar extends StatelessWidget {
  const NewsFeedAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      expandedHeight: 320,
      flexibleSpace: FlexibleSpaceBar(
          background: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("https://picsum.photos/200/300"),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "What's on your mind?",
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.photo))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 12,
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.4)),
          ),
          SizedBox(
            height: 10,
          ),

          /// store section for stories
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                        width: 120,
                        height: 220,
                        child: Column(
                          children: [
                            Container(
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(20),
                              //   color: Colors.grey.withOpacity(0.4),
                              // ),
                              height: 120,
                              width: 120,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Stack(
                                    // alignment: Alignment.bottomCenter,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          "https://kentylaartsdesigns.com/olumooje/2015/04/camera_pic.jpg",
                                          width: 120,
                                          fit: BoxFit.cover,
                                          height: 120,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                      bottom: -20,
                                      child: SizedBox(
                                        width: 120,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: kPrimaryColor,
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "Add to story",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Container(
                          child: Image.network(
                              "https://images.pexels.com/photos/4424567/pexels-photo-4424567.jpeg?cs=srgb&dl=pexels-josh-hild-4424567.jpg&fm=jpg"),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 10,
                          child: CircleAvatar(
                            radius: 33,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  "https://kentylaartsdesigns.com/olumooje/2015/04/camera_pic.jpg"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
