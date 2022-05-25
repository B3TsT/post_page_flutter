import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:post_page/src/my_web_page.dart';
import 'package:post_page/src/navigation_bar/nav_bar_buttom.dart';
import 'package:post_page/src/widget/responsive_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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

class DesktopNavBar extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isScrolled = ref.watch(scrolledProvider);

    final navBarColor = isScrolled ? Colors.blue : Colors.white;

    return Container(
      color: navBarColor,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 40.0,
            ),
            SizedBox(width: 10.0),
            Text(
              'Company Name',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black87,
                fontSize: 32,
              ),
            ),
            /**
             * Logo
             */
            Expanded(child: Container()),
            NavBarButtom(
                onTap: () =>
                    ref.read(currentPageProvider.state).state = homeKey,
                text: 'Home'),
            NavBarButtom(
                onTap: () =>
                    ref.read(currentPageProvider.state).state = featureKey,
                text: 'Features'),
            NavBarButtom(
                onTap: () =>
                    ref.read(currentPageProvider.state).state = screenshotKey,
                text: 'Screenshots'),
            NavBarButtom(
                onTap: () =>
                    ref.read(currentPageProvider.state).state = contactKey,
                text: 'Contact'),
          ],
        ),
      ),
    );
  }
}

class MobileNavBar extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final containerHeight = useState<double>(0.0);

    final isScrolled = ref.watch(scrolledProvider);

    final navBarColor = isScrolled ? Colors.blue : Colors.white60;

    return Stack(
      children: [
        AnimatedContainer(
          margin: EdgeInsets.only(top: 75.0),
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
          height: containerHeight.value,
          child: SingleChildScrollView(
            child: Column(
              children: [
                NavBarButtom(
                    onTap: () =>
                        ref.read(currentPageProvider.state).state = homeKey,
                    text: 'Home'),
                NavBarButtom(
                    onTap: () =>
                        ref.read(currentPageProvider.state).state = featureKey,
                    text: 'Features'),
                NavBarButtom(
                    onTap: () => ref.read(currentPageProvider.state).state =
                        screenshotKey,
                    text: 'Screenshots'),
                NavBarButtom(
                    onTap: () =>
                        ref.read(currentPageProvider.state).state = contactKey,
                    text: 'Contact'),
              ],
            ),
          ),
        ),
        Container(
          color: navBarColor,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 40.0,
                ),
                SizedBox(width: 10.0),
                Text(
                  'Company Name',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    fontSize: 32,
                  ),
                ),
                Expanded(child: Container()),
                Material(
                  child: InkWell(
                    splashColor: Colors.white60,
                    onTap: () {
                      final height = containerHeight.value > 0 ? 0.0 : 240.0;
                      containerHeight.value = height;
                    },
                    child: Icon(
                      Icons.menu,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
