import 'package:client_portal/model/project_model.dart';
import 'package:client_portal/pages/project_page.dart';
import 'package:client_portal/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(project.deadline);
    final width = MediaQuery.of(context).size.width;

    Color signColor = primaryColor;
    String signText = "ON GOING";
    String progressText = "65%";
    Color progressColor = primaryColor;
    double progressPercent = 0.65;

    switch (project.status) {
      case "On Going":
        break;
      case "Completed":
        signColor = Colors.green;
        signText = "COMPLETED";
        progressColor = Colors.green;
        progressText = "100%";
        progressPercent = 1.0;
      case "Revision":
        signColor = Colors.orange;
        signText = "REVISION";
        progressColor = Colors.orange;
        progressText = "100%";
        progressPercent = 1.0;
      default:
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => ProjectPage(
                  project: project,
                )),
          ),
        );
      },
      child: Padding(
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
                  color: signColor,
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
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  project.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  project.jenis,
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 13,
                                    color: blackColor,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(5, 5, 12, 5),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                color: signColor,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 10,
                                    color: whiteColor,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    signText,
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 9,
                                      color: whiteColor,
                                      fontWeight: semibold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 16,
                                  color: blackColor.withOpacity(0.5),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  DateFormat('dd / MM / yyyy')
                                      .format(dateTime)
                                      .toString(),
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
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 15,
                        ),
                        child: CircularPercentIndicator(
                          radius: 52,
                          lineWidth: 12.0,
                          backgroundColor: Color(0xFFE7EAEE),
                          percent: progressPercent,
                          progressColor: progressColor,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            progressText,
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
      ),
    );
  }
}
