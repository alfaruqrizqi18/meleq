import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailVideo extends StatefulWidget {
  final String link;

  const DetailVideo({Key key, this.link}) : super(key: key);
  @override
  _DetailVideoState createState() => _DetailVideoState();
}

class _DetailVideoState extends State<DetailVideo> {
  String urlToPlay = "";
  YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      urlToPlay = widget.link;
      _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(urlToPlay),
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: YoutubePlayer(
        controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
