import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:post_page/src/widget/responsive_widget.dart';

// final youtubeVideo = Uri.parse('https://www.youtube.com/watch?v=QcCwyPsyuVA');
const youtubeVideo = 'https://player.vimeo.com/video/76979871';

class FeaturesContent extends ResponsiveWidget {
  FeaturesContent({Key? key}) : super(key: key) {
    ui.platformViewRegistry.registerViewFactory(
      'youtube-video',
      (int viewId) => IFrameElement()
        ..src = youtubeVideo
        ..style.border = 'none',
    );
  }
  @override
  Widget buildDesktop(BuildContext context) =>
      FeaturesContentResponsive(horizontalPadding: 200);

  @override
  Widget buildMobile(BuildContext context) =>
      FeaturesContentResponsive(horizontalPadding: 24);
}

class FeaturesContentResponsive extends StatelessWidget {
  final horizontalPadding;

  const FeaturesContentResponsive({super.key, required this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
        child: Column(
          children: [
            Text(
              'Features Section',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: 800,
              height: 450,
              child: HtmlElementView(
                viewType: 'youtube-video',
                key: UniqueKey(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
