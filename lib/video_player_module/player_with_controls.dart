import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:view_file_url_flutter/video_player_module/video_view.dart';
import 'package:view_file_url_flutter/video_player_module/helpers/adaptive_controls.dart';
import 'package:view_file_url_flutter/video_player_module/notifiers/player_notifier.dart';

class PlayerWithControls extends StatelessWidget {
  const PlayerWithControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaController mediaController = MediaController.of(context);

    double _calculateAspectRatio(BuildContext context) {
      final size = MediaQuery.of(context).size;
      final width = size.width;
      final height = size.height;

      return width > height ? width / height : height / width;
    }

    Widget _buildControls(
      BuildContext context,
      MediaController mediaController,
    ) {
      return mediaController.showControls
          ? mediaController.customControls ?? const AdaptiveControls()
          : Container();
    }

    Widget _buildPlayerWithControls(
        MediaController mediaController, BuildContext context) {
      return Stack(
        children: <Widget>[
          mediaController.placeholder ?? Container(),
          Center(
            child: AspectRatio(
              aspectRatio: mediaController.aspectRatio ??
                  mediaController.videoPlayerController.value.aspectRatio,
              child: VideoPlayer(mediaController.videoPlayerController),
            ),
          ),
          mediaController.overlay ?? Container(),
          if (Theme.of(context).platform != TargetPlatform.iOS)
            Consumer<PlayerNotifier>(
              builder: (
                BuildContext context,
                PlayerNotifier notifier,
                Widget? widget,
              ) =>
                  AnimatedOpacity(
                opacity: notifier.hideStuff ? 0.0 : 0.8,
                duration: const Duration(
                  milliseconds: 250,
                ),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black54),
                  child: Container(),
                ),
              ),
            ),
          if (!mediaController.isFullScreen)
            _buildControls(context, mediaController)
          else
            SafeArea(
              bottom: false,
              child: _buildControls(context, mediaController),
            ),
        ],
      );
    }

    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: AspectRatio(
          aspectRatio: _calculateAspectRatio(context),
          child: _buildPlayerWithControls(mediaController, context),
        ),
      ),
    );
  }
}
