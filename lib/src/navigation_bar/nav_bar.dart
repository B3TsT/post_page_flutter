import 'package:flutter/material.dart';
import 'package:post_page/src/widget/responsive_widget.dart';

class NavBar extends ResponsiveWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget buildDesktop(BuildContext context) {
    return DesktopNavBar();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return MobileNavBar();
  }
}

class DesktopNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class MobileNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
