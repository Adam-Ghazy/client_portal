import 'package:client_portal/theme.dart';
import 'package:flutter/material.dart';

class TutorialCard extends StatelessWidget {
  const TutorialCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/play');
      },
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
                    color: Colors.pink[100],
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
                    "12:30",
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
            "New Jeans, Lagu Ini Menarik Biasanya Namanya",
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
            "Date Posted - 27 Desember 2023",
            style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semibold,
                color: blackColor.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
