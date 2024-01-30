import 'package:client_portal/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    String contact = "6285736426304";
    openWhatsapp() async {
      var androidUrl =
          "whatsapp://send?phone=$contact&text=Hi, saya butuh bantuan mengenai projek saya";

      try {
        await launchUrl(Uri.parse(androidUrl));
      } on Exception {
        print('Something went wrong');
      }
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact and Support",
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semibold,
          ),
        ),
      ),
      backgroundColor: whiteColor,
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image_contact_us.png",
            ),
            Text(
              "Have a Question or Comment?\nWe're Here to Help!",
              textAlign: TextAlign.center,
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 4.0)
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF4fcd65),
                      Color(0xFF4fcd65),
                      Color(0xFF87e397),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: whiteColor,
                    width: 1.5,
                  )),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  minimumSize:
                      MaterialStateProperty.all(Size(size.width - 60, 50)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  // elevation: MaterialStateProperty.all(3),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: openWhatsapp,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icon_whatsapp.png",
                          color: whiteColor,
                          height: 30,
                        ),
                        VerticalDivider(
                          width: 30,
                          color: whiteColor,
                          thickness: 0.5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "WHATSAPP",
                              style: primaryTextStyle.copyWith(
                                // color: blackColor.withOpacity(0.6),
                                color: whiteColor,
                                fontSize: 12,
                                fontWeight: semibold,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              "+62 857-3642-6304",
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                color: whiteColor,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
