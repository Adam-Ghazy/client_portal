import 'package:client_portal/api_address.dart';
import 'package:client_portal/model/project_model.dart';
import 'package:client_portal/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProjectPage extends StatelessWidget {
  final ProjectModel project;
  const ProjectPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    DateTime deadline = DateTime.parse(project.deadline);
    DateTime masaAktif = DateTime.parse(project.masaAktif);
    final width = MediaQuery.of(context).size.width;

    Color signColor = primaryColor;
    String signText = "ON GOING";

    switch (project.status) {
      case "On Going":
        break;
      case "Completed":
        signColor = Colors.green;
        signText = "COMPLETED";

      case "Revision":
        signColor = Colors.orange;
        signText = "REVISION";

      default:
    }
    return Scaffold(
      backgroundColor: whiteColor,
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
        backgroundColor: signColor,
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
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(
                    "$baseUrl/storage/${project.urlPhoto}",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: width,
              padding: const EdgeInsets.fromLTRB(
                20,
                20,
                20,
                20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 12, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      color: signColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 12,
                          color: whiteColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          signText,
                          style: primaryTextStyle.copyWith(
                            fontSize: 10,
                            color: whiteColor,
                            fontWeight: semibold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    project.name,
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    project.jenis,
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semibold,
                      color: blackColor.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      border: Border.all(
                        width: 0.75,
                        // color: Colors.grey[900]!,
                        color: signColor,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 24,
                          offset: Offset(0, 11),
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Deadline",
                                  style: primaryTextStyle.copyWith(
                                    color: blackColor.withOpacity(0.5),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  DateFormat('dd / MM / yyyy')
                                      .format(deadline)
                                      .toString(),
                                  style: primaryTextStyle.copyWith(
                                    color: blackColor,
                                    fontSize: 12,
                                    fontWeight: semibold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          VerticalDivider(
                            width: 60,
                            thickness: 0.75,
                            color: signColor,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Masa Aktif",
                                  style: primaryTextStyle.copyWith(
                                    color: blackColor.withOpacity(0.5),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  DateFormat('dd / MM / yyyy')
                                      .format(masaAktif)
                                      .toString(),
                                  style: primaryTextStyle.copyWith(
                                    color: blackColor,
                                    fontSize: 12,
                                    fontWeight: semibold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Keterangan",
                    style: primaryTextStyle.copyWith(
                      fontWeight: semibold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    project.keterangan,
                    textAlign: TextAlign.justify,
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Note",
                    style: primaryTextStyle.copyWith(
                      fontWeight: semibold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    project.notes,
                    textAlign: TextAlign.justify,
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
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
