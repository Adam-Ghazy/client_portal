import 'package:client_portal/pages/home/chat_page.dart';
import 'package:client_portal/pages/home/home_page.dart';
import 'package:client_portal/pages/home/tutorial_page.dart';
import 'package:client_portal/provider/auth_provider.dart';
import 'package:client_portal/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavbarMain extends StatefulWidget {
  @override
  State<NavbarMain> createState() => _NavbarMainState();
}

class _NavbarMainState extends State<NavbarMain> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Widget customBottomNav() {
      return BottomAppBar(
        // height: 100,
        shape: CircularNotchedRectangle(),
        // notchMargin: 12,
        clipBehavior: Clip.antiAlias,
        child: Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.white,
              currentIndex: currentIndex,
              onTap: (value) {
                print(value);
                setState(() {
                  currentIndex = value;
                });
              },
              // type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      // margin: EdgeInsets.only(
                      //   top: 20,
                      // ),
                      child: Column(
                        children: [
                          // Image.asset(
                          //   currentIndex == 0
                          //       ? 'assets/icon_home_on.png'
                          //       : 'assets/icon_home_off.png',
                          //   width: 26,
                          //   // color: currentIndex == 0 ? primaryColor : iconColor,
                          // ),
                          Icon(
                            currentIndex == 0 ? Icons.home : Icons.home_filled,
                            size: 30,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "Home",
                            style: GoogleFonts.poppins(
                              color:
                                  currentIndex == 0 ? primaryColor : blackColor,
                              fontWeight: semibold,
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      // margin: EdgeInsets.only(
                      //   top: 20,
                      // ),
                      child: Column(
                        children: [
                          // Image.asset(
                          //   currentIndex == 1
                          //       ? 'assets/icon_service_on.png'
                          //       : 'assets/icon_service_off.png',
                          //   width: 23,
                          //   // color: currentIndex == 0 ? primaryColor : iconColor,
                          // ),
                          Icon(
                            currentIndex == 0
                                ? Icons.chat_bubble
                                : Icons.chat_bubble_rounded,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text("View All",
                              style: GoogleFonts.poppins(
                                  color: currentIndex == 1
                                      ? primaryColor
                                      : blackColor,
                                  fontWeight: semibold,
                                  fontSize: 10))
                        ],
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      // margin: EdgeInsets.only(
                      //   top: 20,
                      // ),
                      child: Column(
                        children: [
                          // Image.asset(
                          //   currentIndex == 3
                          //       ? 'assets/icon_history_on.png'
                          //       : 'assets/icon_history_off.png',
                          //   width: 26,
                          //   // color: currentIndex == 0 ? primaryColor : iconColor,
                          // ),
                          Icon(
                            currentIndex == 0
                                ? Icons.video_camera_back_outlined
                                : Icons.video_camera_back_outlined,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text("My List",
                              style: GoogleFonts.poppins(
                                  color: currentIndex == 3
                                      ? primaryColor
                                      : blackColor,
                                  fontWeight: semibold,
                                  fontSize: 10))
                        ],
                      ),
                    ),
                    label: ''),
              ]),
        ),
      );
    }

    int previousIndex = 0;

    Widget body() {
      switch (currentIndex) {
        case 0:
          previousIndex = 0;

          return HomePage();
          break;
        case 1:
          previousIndex = 1;
          return ChatPage();
          break;
        case 2:
          previousIndex = 2;
          return TutorialPage();
          break;

        default:
          currentIndex = previousIndex;
          return body();
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
