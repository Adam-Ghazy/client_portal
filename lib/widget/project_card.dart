import 'package:client_portal/theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        child: Container(
          width: width - 20,
          // padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: whiteColor,
          ),
          child: Stack(
            children: [
              Container(
                height: 140,
                width: 8,
                color: primaryColor,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  25,
                  15,
                  15,
                  15,
                ),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Project: Test 1',
                              style: primaryTextStyle.copyWith(
                                fontWeight: bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Website Bisnis",
                              style: primaryTextStyle.copyWith(
                                fontWeight: semibold,
                                fontSize: 13,
                                color: blackColor.withOpacity(0.5),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              size: 18,
                              color: blackColor.withOpacity(0.5),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '23 Januari 2023',
                              style: primaryTextStyle.copyWith(
                                fontWeight: semibold,
                                fontSize: 13,
                                color: blackColor.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      child: CircularPercentIndicator(
                        radius: 52,
                        lineWidth: 12.0,
                        backgroundColor: Color(0xFFE7EAEE),
                        percent: 0.65,
                        progressColor: primaryColor,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Text(
                          "65%",
                          style: primaryTextStyle.copyWith(
                            color: blackColor,
                            fontWeight: bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
