import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../include/Rows/welcomepagemain.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: WelcomePageMob(),
      desktop: WelcomePageDesk(),
      tablet: WelcomePageTab(),    
    );
  }
}
