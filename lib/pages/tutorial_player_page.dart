// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:client_portal/model/tutorial_model.dart';
import 'package:client_portal/theme.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TutorialPlayerPage extends StatefulWidget {
  final String videoId;
  final TutorialModel tutorial;
  const TutorialPlayerPage(
      {Key? key, required this.videoId, required this.tutorial})
      : super(key: key);

  @override
  State<TutorialPlayerPage> createState() => _TutorialPlayerPageState();
}

class _TutorialPlayerPageState extends State<TutorialPlayerPage> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  void dispose() {
    // Memanggil dispose pada YoutubePlayerController
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          progressColors: ProgressBarColors(
            playedColor: primaryColor,
            handleColor: primaryColor,
          ),
          controller: _controller,
        ),
        builder: (context, player) {
          return Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: whiteColor,
                ),
              ),
              backgroundColor: primaryColor,
              title: Text(
                "Video Tutorial",
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semibold,
                ),
              ),
            ),
            body: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  player,
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.tutorial.title,
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semibold,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Published on ${widget.tutorial.publishedAt}",
                          style: primaryTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: semibold,
                              color: blackColor.withOpacity(0.5)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Description",
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semibold,
                            color: blackColor,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.tutorial.description.isEmpty
                              ? "Tidak ada deskripsi"
                              : widget.tutorial.description,
                          textAlign: TextAlign.justify,
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
