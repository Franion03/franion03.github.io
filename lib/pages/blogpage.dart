import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../include/Rows/blogcardmain.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => BlogCardDesk(),
       tablet: (BuildContext context) => BlogCardTab(),
       mobile: (BuildContext context) => BlogCardMob(),      
    );
  }
}