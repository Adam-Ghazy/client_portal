// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:client_portal/theme.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TutorialPlayerPage extends StatefulWidget {
  const TutorialPlayerPage({Key? key}) : super(key: key);

  @override
  State<TutorialPlayerPage> createState() => _TutorialPlayerPageState();
}

class _TutorialPlayerPageState extends State<TutorialPlayerPage> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );
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
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                player,
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama New Jeans, Antara Lain",
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semibold,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Published on 23 January 2023",
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
                          "What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          textAlign: TextAlign.justify,
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
