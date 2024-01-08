import 'package:client_portal/theme.dart';
import 'package:client_portal/widget/filter_progress_card.dart';
import 'package:client_portal/widget/project_card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedFilter = "All";

  void _onCategoryCardTap(String select) {
    setState(() {
      selectedFilter = select;
    });
  }

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

    Widget headerButton() {
      return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Text(
            'Your Button Text',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    // Widget progressClient() {
    //   double screenWidth = MediaQuery.of(context).size.width;

    // }

    return Scaffold(
      backgroundColor: primaryColor,
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
          // padding: const EdgeInsets.symmetric(
          //   horizontal: 30,
          //   vertical: 20,
          // ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: headerProfile(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: headerStatus(),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: bgButtonHeader,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      controller: ScrollController(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(1, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FilterProgressCard(
                                  selected: selectedFilter == "All",
                                  lable: "All (3)",
                                  onTap: (isSelected) {
                                    setState(() {
                                      selectedFilter = "All";
                                    });
                                    _onCategoryCardTap("All");
                                  },
                                ),
                                FilterProgressCard(
                                  selected: selectedFilter == "On Going",
                                  lable: "On Going",
                                  onTap: (isSelected) {
                                    setState(() {
                                      selectedFilter = "On Going";
                                    });
                                    _onCategoryCardTap("On Going");
                                  },
                                ),
                                FilterProgressCard(
                                  selected: selectedFilter == "Completed",
                                  lable: "Completed",
                                  onTap: (isSelected) {
                                    setState(() {
                                      selectedFilter = "Completed";
                                    });
                                    _onCategoryCardTap("Completed");
                                  },
                                ),
                                FilterProgressCard(
                                  selected: selectedFilter == "Revision",
                                  lable: "Revision",
                                  onTap: (isSelected) {
                                    setState(() {
                                      selectedFilter = "Revision";
                                    });
                                    _onCategoryCardTap("Revision");
                                  },
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      controller: ScrollController(),
                      scrollDirection: Axis.vertical,
                      child: Row(
                        children: List.generate(1, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/project');
                                      },
                                      child: ProjectCard(),
                                    ),
                                    ProjectCard(),
                                    ProjectCard(),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
