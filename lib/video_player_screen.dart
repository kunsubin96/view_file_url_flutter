import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:view_file_url_flutter/video_player_module/video_view.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({
    Key? key,
    this.title,
    required this.urlVideo
  }) : super(key: key);

  final String? title;
  final String urlVideo;

  @override
  State<StatefulWidget> createState() => _VideoPlayerScreen();
}

class _VideoPlayerScreen extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  MediaController? _mediaController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _mediaController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(
        widget.urlVideo);
    await Future.wait([
      _videoPlayerController.initialize(),
    ]);
    _mediaController = MediaController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      showOptions: true,
    );
    setState(() {});
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
      backgroundColor: Colors.transparent,
      body: Center(
        child: _mediaController != null &&
                _mediaController!.videoPlayerController.value.isInitialized
            ? VideoView(
                controller: _mediaController!,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Loading'),
                ],
              ),
      ),
    );
  }
}
