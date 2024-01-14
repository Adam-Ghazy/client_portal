import 'package:client_portal/api_address.dart';
import 'package:client_portal/model/client_model.dart';
import 'package:client_portal/model/project_model.dart';
import 'package:client_portal/provider/auth_provider.dart';
import 'package:client_portal/theme.dart';
import 'package:client_portal/widget/filter_progress_card.dart';
import 'package:client_portal/widget/project_card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedFilter = "All";

  void _onCategoryCardTap(String select) {
    print(select);
    setState(() {
      selectedFilter = select;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    ClientModel client = authProvider.client;
    List<ProjectModel> projects = authProvider.client.projects;

    List<String> namaLengkap = client.name.split(" ");

    Widget headerProfile() {
      return Row(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      "$baseUrl/storage/${client.urlPhoto}",
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
                  client.name[0],
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
                  "Hello, ${namaLengkap[0]}",
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
      return IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  projects.isNotEmpty ? projects.length.toString() : "0",
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
            VerticalDivider(
              color: whiteColor,
            ),
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
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
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
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                height: 220,
                color: primaryColor,
                child: Column(
                  children: [
                    headerProfile(),
                    const SizedBox(
                      height: 20,
                    ),
                    headerStatus(),
                  ],
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 30,
              //     vertical: 20,
              //   ),
              //   child: headerProfile(),
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 30,
              //     vertical: 20,
              //   ),
              //   child: headerStatus(),
              // ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 20,
                        width: double.infinity,
                        color: primaryColor,
                      ),
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
                                      lable: "All",
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
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 20,
                        width: double.infinity,
                        color: bgButtonHeader,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ...projects
                                          .map(
                                            (item) =>
                                                ProjectCard(project: item),
                                          )
                                          .where((item) =>
                                              selectedFilter == "All"
                                                  ? item.project.id > 0
                                                  : item.project.status ==
                                                      selectedFilter)
                                          .toList()
                                    ]),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
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
