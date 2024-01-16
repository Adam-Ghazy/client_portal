import 'package:client_portal/api_address.dart';
import 'package:client_portal/model/tutorial_model.dart';
import 'package:client_portal/pages/tutorial_player_page.dart';
import 'package:client_portal/theme.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TutorialCard extends StatelessWidget {
  final TutorialModel tutorial;
  const TutorialCard({super.key, required this.tutorial});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => TutorialPlayerPage(
                  videoId: YoutubePlayer.convertUrlToId(tutorial.link)!,
                  tutorial: tutorial,
                )),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          tutorial.urlThumbnail,
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.grey[400],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      bottom: 10,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: blackColor.withOpacity(0.7),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      tutorial.duration,
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              tutorial.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semibold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Date Published - ${tutorial.publishedAt}",
              style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semibold,
                  color: blackColor.withOpacity(0.5)),
            ),
          ],
        ),
      ),
    );
  }
}
