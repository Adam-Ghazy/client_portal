import 'package:client_portal/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget headerProfile() {
      return Row(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1533050487297-09b450131914?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: primaryColor,
                  ),
                  color: whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                ),
                child: Center(
                    child: Text(
                  "S",
                  style: primaryTextStyle.copyWith(
                    color: primaryColor,
                  ),
                )),
              )
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, Ms Saville",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 24,
                    fontWeight: semibold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Welcome to Client Portal Wbcare",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget headerStatus() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "20",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 24,
                  fontWeight: semibold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Project",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 16,
                  fontWeight: regular,
                ),
              ),
            ],
          ),
          VerticalDivider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "461",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 24,
                  fontWeight: semibold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "FOLLOWING",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 16,
                  fontWeight: regular,
                ),
              )
            ],
          ),
          // SizedBox(
          //   width: 20,
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "348",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 24,
                  fontWeight: semibold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "FOLLOWERS",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 16,
                  fontWeight: regular,
                ),
              )
            ],
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        title: Text(
          'Webcare Projects',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
            color: whiteColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: whiteColor,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: primaryColor,
        toolbarHeight: 60,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          child: Column(
            children: [
              headerProfile(),
              const SizedBox(
                height: 25,
              ),
              headerStatus(),
            ],
          ),
        ),
      ),
    );
  }
}
