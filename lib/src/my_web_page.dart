import 'package:post_page/src/content/contact_content.dart';
import 'package:post_page/src/content/features_content.dart';
import 'package:post_page/src/content/home_content.dart';
import 'package:post_page/src/content/screenshots_content.dart';
import 'package:post_page/src/navigation_bar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final scrolledProvider = StateProvider<bool>((_) => false);

class MyWebPage extends HookConsumerWidget {
  void onScroll(ScrollController controller, WidgetRef ref) {
    final isScrolled = ref.read(scrolledProvider);
    if (controller.position.pixels > 5 && !isScrolled) {
      ref.read(scrolledProvider.state).state = true;
    } else if (controller.position.pixels <= 5 && isScrolled) {
      ref.read(scrolledProvider.state).state = false;
    }
  }

  const MyWebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = useScrollController();

    useEffect(() {
      _controller.addListener(() => onScroll(_controller, ref));
      return _controller.dispose;
    }, [_controller]);

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
                  controller: _controller,
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
