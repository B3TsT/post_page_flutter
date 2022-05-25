import 'package:flutter/material.dart';
import 'package:post_page/src/content/contact_content.dart';
import 'package:post_page/src/content/features_content.dart';
import 'package:post_page/src/content/home_content.dart';
import 'package:post_page/src/content/screenshots_content.dart';
import 'package:post_page/src/navigation_bar/nav_bar.dart';

class MyWebPage extends StatelessWidget {
  const MyWebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double maxWidth = width > 1200 ? 1200 : width;

    return Scaffold(
      body: Center(
        child: Container(
          width: maxWidth,
          child: Column(
            children: [
              //Navigation Bar
              NavBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      // Home
                      HomeContent(),
                      // Features
                      FeaturesContent(),
                      // Screenshots
                      ScreenshotsContent(),
                      // Contact
                      ContactContent(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
