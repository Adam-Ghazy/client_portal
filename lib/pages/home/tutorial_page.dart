import 'package:client_portal/theme.dart';
import 'package:client_portal/widget/tutorial_card.dart';
import 'package:flutter/material.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(
          'Video Tutorial',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
          ),
        ),
        backgroundColor: whiteColor,
        toolbarHeight: 60,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: const Column(
            children: [
              TutorialCard(),
              SizedBox(
                height: 25,
              ),
              TutorialCard(),
              SizedBox(
                height: 25,
              ),
              TutorialCard(),
            ],
          ),
        ),
      ),
    );
  }
}
