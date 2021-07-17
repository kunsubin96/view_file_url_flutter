import 'package:flutter/material.dart';
import 'package:view_file_url_flutter/youtube_player_flutter/player/youtube_player.dart';
import 'package:view_file_url_flutter/youtube_player_flutter/utils/youtube_player_controller.dart';
import 'package:view_file_url_flutter/youtube_player_flutter/utils/youtube_player_flags.dart';
import 'package:view_file_url_flutter/youtube_player_flutter/widgets/duration_widgets.dart';
import 'package:view_file_url_flutter/youtube_player_flutter/widgets/full_screen_button.dart';
import 'package:view_file_url_flutter/youtube_player_flutter/widgets/progress_bar.dart';

class YoutubePlayerScreen1 extends StatefulWidget{
  YoutubePlayerScreen1({this.title, required this.urlYoutube});
  final String? title;
  final String urlYoutube;
  @override
  State<StatefulWidget> createState() =>YoutubePlayerScreen1State();

}
class YoutubePlayerScreen1State extends State<YoutubePlayerScreen1>{
  late YoutubePlayerController _controller;
  late String videoId;
  @override
  void initState() {
    super.initState();
    videoId=YoutubePlayer.convertUrlToId(widget.urlYoutube)??"";
    _controller=YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: true,
          ),
        );
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          titleSpacing: 0,
          title: Text(
            widget.title??"",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800]),
            overflow: TextOverflow.ellipsis,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.grey[800],
            onPressed: () => Navigator.pop(context),
            iconSize: 24.0,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.black,
      body: Center(
        child: YoutubePlayer(
            controller: _controller,
            actionsPadding: const EdgeInsets.only(left: 16.0),
            bottomActions: [
              CurrentPosition(),
              const SizedBox(width: 10.0),
              ProgressBar(isExpanded: true,),
              const SizedBox(width: 10.0),
              RemainingDuration(),
              FullScreenButton(
                
              ),
            ],
          ),
      ),
    );
  }

}