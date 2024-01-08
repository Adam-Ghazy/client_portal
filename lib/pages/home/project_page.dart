import 'package:client_portal/theme.dart';
import 'package:flutter/material.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Detail Project',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
            color: whiteColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: width / 1.5,
              width: width,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Project Website Sekolah",
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Website Business (Pro)",
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semibold,
                      color: blackColor.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        size: 14,
                        color: primaryColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "23 Januari 2023",
                        style: primaryTextStyle.copyWith(
                          color: primaryColor,
                          fontWeight: medium,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Keterangan",
                    style: primaryTextStyle.copyWith(
                      fontWeight: semibold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
