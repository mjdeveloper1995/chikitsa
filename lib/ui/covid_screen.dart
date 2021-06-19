import 'package:chikitsa/utils/app.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CovidScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          createUpperBar(context, "Covid19 Help"),
          Container(
              width: double.infinity,
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: 'Kc90OgdyAAY', //Add videoID.
                  flags: const YoutubePlayerFlags(
                    hideControls: false,
                    controlsVisibleAtStart: true,
                    autoPlay: false,
                    mute: false,
                  ),
                ),
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.greenAccent,
              )),
        ],
      ),
    );
  }
}
