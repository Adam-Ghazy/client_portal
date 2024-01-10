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
      return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? Image.asset(
                    "assets/icon_home_selected.png",
                    height: 22,
                  )
                : Image.asset(
                    "assets/icon_home_unselected.png",
                    height: 22,
                  ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 1
                ? Image.asset(
                    "assets/icon_tutorial_selected.png",
                    height: 20,
                  )
                : Image.asset(
                    "assets/icon_tutorial_unselected.png",
                    height: 20,
                  ),
            label: 'Tutorial',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 2
                ? Image.asset(
                    "assets/icon_contact_selected.png",
                    height: 25,
                  )
                : Image.asset(
                    "assets/icon_contact_unselected.png",
                    height: 25,
                  ),
            label: 'Contact',
          ),
        ],
        unselectedLabelStyle: primaryTextStyle.copyWith(
          fontWeight: semibold,
        ),
        unselectedFontSize: 12,
        selectedLabelStyle: primaryTextStyle.copyWith(
          fontWeight: semibold,
        ),
        selectedFontSize: 12,
        unselectedItemColor: Colors.grey,
        selectedItemColor: primaryColor,
        currentIndex: currentIndex,
        backgroundColor: whiteColor,
        elevation: 10,
        onTap: (value) {
          print(value);
          setState(() {
            currentIndex = value;
          });
        },
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
          return TutorialPage();
          break;
        case 2:
          previousIndex = 2;
          return ChatPage();
          break;

        default:
          currentIndex = previousIndex;
          return body();
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
