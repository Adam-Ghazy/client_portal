import 'package:client_portal/model/tutorial_model.dart';
import 'package:client_portal/provider/tutorial_provider.dart';
import 'package:client_portal/theme.dart';
import 'package:client_portal/widget/tutorial_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadTutorial();
  }

  loadTutorial() async {
    await Provider.of<TutorialProvider>(context, listen: false).getTutorials();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    TutorialProvider tutorialProvider = Provider.of<TutorialProvider>(context);
    List<TutorialModel> tutorials = tutorialProvider.tutorials;

    Widget loadingSkeleton() {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.pink[100],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                        bottom: 10,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: blackColor.withOpacity(0.7),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 16,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 14,
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
              Container(
                width: width / 2,
                height: 14,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget listSkeleton() {
      return SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            loadingSkeleton(),
            loadingSkeleton(),
            loadingSkeleton(),
          ],
        ),
      );
    }

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
      body: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: _isLoading
            ? listSkeleton()
            : SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(Duration(seconds: 1), () {
                      setState(() {
                        loadTutorial();
                      });
                    });
                  },
                  child: Column(
                    children: [
                      ...tutorials
                          .map(
                            (item) => TutorialCard(tutorial: item),
                          )
                          .toList(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
