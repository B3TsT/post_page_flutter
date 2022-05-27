import 'package:flutter/material.dart';
import 'package:post_page/src/widget/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';

final googlePlayUrl = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.google.android.youtube');
final appStoreUrl =
    Uri.parse('https://apps.apple.com/tw/app/youtube/id544007664');

class HomeContent extends ResponsiveWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget buildDesktop(BuildContext context) {
    return DesktopHomeContent();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return MobileHomeContent();
  }
}

class DesktopHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .65,
      child: Row(
        children: [
          Container(
            width: width * .3,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset('assets/images/app_screen.png'),
            ),
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Basic Landing Webpage',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                    'Eu minim commodo ea pariatur excepteur ullamco pariatur. Et quis animpariatur ex qui dolore nostrud nostrud. Eiusmod nostrud quis quis irure enim ea magna non nostrud Lorem proident ullamco commodo. Esse velit velit tempor mollit elit anim id commodo. Eu adipisicing nulla ex incididunt commodo non id proident consequat esse.'),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => launchUrl(googlePlayUrl),
                      child: Image.asset(
                        'assets/images/google_play_badge.png',
                        height: 60,
                        width: 200,
                      ),
                    ),
                    SizedBox(width: 24),
                    GestureDetector(
                      onTap: () => launchUrl(appStoreUrl),
                      child: Image.asset(
                        'assets/images/app_store_badge.png',
                        height: 60,
                        width: 200,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MobileHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Basic Landing Webpage',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          SizedBox(height: 24),
          Text(
              'Eu minim commodo ea pariatur excepteur ullamco pariatur. Et quis animpariatur ex qui dolore nostrud nostrud. Eiusmod nostrud quis quis irure enim ea magna non nostrud Lorem proident ullamco commodo. Esse velit velit tempor mollit elit anim id commodo. Eu adipisicing nulla ex incididunt commodo non id proident consequat esse.'),
          SizedBox(height: 24),
          Image.asset(
            'assets/images/app_screen.png',
            height: 350,
          ),
          SizedBox(height: 24),
          GestureDetector(
            onTap: () => launchUrl(googlePlayUrl),
            child: Image.asset(
              'assets/images/google_play_badge.png',
              height: 60,
              width: 200,
            ),
          ),
          SizedBox(height: 24),
          GestureDetector(
            onTap: () => launchUrl(appStoreUrl),
            child: Image.asset(
              'assets/images/app_store_badge.png',
              height: 60,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
