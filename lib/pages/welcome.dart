import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../include/Rows/welcomepagemain.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const WelcomePageMob(),
      desktop: (BuildContext context) => const WelcomePageDesk(),
      tablet: (BuildContext context) => const WelcomePageTab(),
    );
  }
}
