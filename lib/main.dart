import 'package:client_portal/pages/home/home_page.dart';
import 'package:client_portal/pages/home/navbar_main.dart';
import 'package:client_portal/pages/project_page.dart';
import 'package:client_portal/pages/sign_in_page.dart';
import 'package:client_portal/pages/tutorial_player_page.dart';
import 'package:client_portal/provider/auth_provider.dart';
import 'package:client_portal/widget/project_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        )
      ],
      child: MaterialApp(
        title: 'client portal',
        debugShowCheckedModeBanner: false,
        home: const SignInPage(),
        routes: {
          // '/': (context) => NavbarMain(),
          '/home': (context) => NavbarMain(),
          '/project': (context) => ProjectPage(),
          '/play': (context) => TutorialPlayerPage(),
        },
      ),
    );
  }
}
