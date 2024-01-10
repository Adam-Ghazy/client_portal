import 'package:client_portal/theme.dart';
import 'package:flutter/material.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                      color: primaryColor,
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
                          "ON GOING",
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
                        color: primaryColor,
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
                                  "12 / 09 / 2023",
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
                            color: primaryColor,
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
                                  "12 / 09 / 2023",
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
                    "Buat kamu yang sudah tidak sabar, Valorant Episode 8 Act 1 akan dimulai pada 9 Januari 2024 untuk zona waktu Amerika Serikat dan Eropa. Tanggal tersebut juga bertepatan dengan berakhirnya Episode 7 Act 3, sekaligus menjadi transisi dari Episode 7 ke 8.  Riot Games sendiri belum memberikan kepastian terkait jam peluncuran dari Episode 8. Sama seperti pergantian Episode atau Act sebelumnya, queue buat bermain akan dihentikan selama beberapa waktu supaya proses pergantian Episode bisa berjalan dengan lancar.n",
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
                    "Buat kamu yang sudah tidak sabar, ",
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
