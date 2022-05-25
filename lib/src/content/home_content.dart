import 'package:flutter/material.dart';
import 'package:post_page/src/widget/responsive_widget.dart';

class HomeContent extends ResponsiveWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget buildDesktop(BuildContext context) {
    return Container();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return Container();
  }
}
