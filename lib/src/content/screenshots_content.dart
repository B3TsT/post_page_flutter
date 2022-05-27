import 'dart:html';

import 'package:flutter/material.dart';
import 'package:post_page/src/widget/responsive_widget.dart';

class ScreenshotsContent extends ResponsiveWidget {
  const ScreenshotsContent({Key? key}) : super(key: key);

  @override
  Widget buildDesktop(BuildContext context) =>
      ScreenshotsContentResponsive(horizontalPadding: 20);
  @override
  Widget buildMobile(BuildContext context) =>
      ScreenshotsContentResponsive(horizontalPadding: 24);
}

class ScreenshotsContentResponsive extends StatelessWidget {
  final horizontalPadding;

  const ScreenshotsContentResponsive(
      {super.key, required this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
        child: Column(
          children: [
            Text(
              'Screenshots Section',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                  'Ea laboris voluptate sit culpa dolor id consectetur. Cupidatat reprehenderit incididunt occaecat deserunt amet amet exercitation nulla consectetur. Magna proident duis duis consequat. Dolore ipsum fugiat tempor reprehenderit. Elit do incididunt cupidatat ad do dolore deserunt sit sint amet ad.'),
            ),
            SizedBox(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _Image(image: 'assets/images/screenshots/screen1.png'),
                  _Image(image: 'assets/images/screenshots/screen2.png'),
                  _Image(image: 'assets/images/screenshots/screen3.png'),
                  _Image(image: 'assets/images/screenshots/screen4.png'),
                  _Image(image: 'assets/images/screenshots/screen5.png'),
                  _Image(image: 'assets/images/screenshots/screen6.png'),
                  _Image(image: 'assets/images/screenshots/screen7.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  final String image;

  const _Image({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 16),
        Image.asset(image),
        SizedBox(width: 16),
      ],
    );
  }
}
