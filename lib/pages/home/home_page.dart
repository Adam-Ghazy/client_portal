import 'package:client_portal/api_address.dart';
import 'package:client_portal/model/client_model.dart';
import 'package:client_portal/model/project_model.dart';
import 'package:client_portal/model/tutorial_model.dart';
import 'package:client_portal/provider/auth_provider.dart';
import 'package:client_portal/provider/tutorial_provider.dart';
import 'package:client_portal/theme.dart';
import 'package:client_portal/widget/filter_progress_card.dart';
import 'package:client_portal/widget/project_card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isObscure = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  loadClient(String username, String password) async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<AuthProvider>(context, listen: false).login(
      username: username,
      password: password,
    );
    setState(() {
      _isLoading = false;
    });
  }

  String selectedFilter = "All";

  void _onCategoryCardTap(String select) {
    print(select);
    setState(() {
      selectedFilter = select;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    ClientModel client = authProvider.client;
    List<ProjectModel> projects =
        authProvider.client.projects.reversed.toList();
    List<String> namaLengkap = client.name.split(" ");

    TutorialProvider tutorialProvider = Provider.of<TutorialProvider>(context);
    List<TutorialModel> tutorials = tutorialProvider.tutorials;

    Widget projectSkeleton() {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: Container(
              width: width - 20,
              // padding: EdgeInsets.all(10),

              child: Stack(
                children: [
                  Container(
                    height: 140,
                    width: 8,
                    color: primaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      25,
                      15,
                      15,
                      15,
                    ),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: 100,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding: const EdgeInsets.fromLTRB(5, 5, 12, 5),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  color: primaryColor,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: whiteColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Revision",
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 9,
                                        color: whiteColor,
                                        fontWeight: semibold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 50,
                                height: 13,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                          ),
                          child: CircularPercentIndicator(
                            radius: 52,
                            lineWidth: 15.0,
                            backgroundColor: Color(0xFFE7EAEE),
                            percent: 1,
                            progressColor: progressColor,
                            circularStrokeCap: CircularStrokeCap.round,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

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
                  color: whiteColor,
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
                Text(
                  "Welcome to Client Portal Webcare",
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

    Widget listProject() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...projects
              .map(
                (item) => ProjectCard(project: item),
              )
              .where((item) => selectedFilter == "All"
                  ? item.project.id > 0
                  : item.project.status == selectedFilter)
              .toList(),
        ],
      );
    }

    Widget listSkeleton() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          projectSkeleton(),
          projectSkeleton(),
          projectSkeleton(),
          projectSkeleton(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1), () {
            setState(() {
              loadClient(
                client.slug,
                client.password,
              );
            });
          });
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 100,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(
                    30,
                    50,
                    30,
                    10,
                  ),
                  // height: 250,
                  color: primaryColor,
                  child: Column(
                    children: [
                      headerProfile(),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FilterProgressCard(
                                        selected: selectedFilter == "All",
                                        lable: projects.isNotEmpty
                                            ? "All (${projects.length})"
                                            : "All (0)",
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
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            child: Row(
                              children: List.generate(1, (index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                  child: _isLoading
                                      ? listSkeleton()
                                      : listProject(),
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
      ),
    );
  }
}
