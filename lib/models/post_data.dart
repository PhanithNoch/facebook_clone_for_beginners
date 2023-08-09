class Post {
  final String profileUrl;
  final String userName;
  final String postTime;
  final String caption;
  final String photoUrl;

  Post({
    required this.profileUrl,
    required this.userName,
    required this.postTime,
    required this.caption,
    required this.photoUrl,
  });
}

var posts = [
  Post(
    profileUrl:
        "https://images.unsplash.com/photo-1519433645715-907727729370?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
    userName: "Jessica",
    postTime: "10:00 PM",
    caption: "I love you",
    photoUrl:
        "https://yt3.googleusercontent.com/hZDUwjoeQqigphL4A1tkg9c6hVp5yXmbboBR7PYFUSFj5PIJSA483NB5v7b0XVoTN9GCku3tqQ=s900-c-k-c0x00ffffff-no-rj",
  ),
  Post(
    profileUrl:
        "https://images.unsplash.com/photo-1519433645715-907727729370?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=fo",
    userName: "Jessica",
    postTime: "10:00 PM",
    caption: "I love you",
    photoUrl:
        "https://variety.com/wp-content/uploads/2020/10/blackpink.jpg?w=1000",
  ),
];
