import '../Rows/blogcardmain.dart';
import 'package:flutter/material.dart';

class BlogCenterDesk extends StatelessWidget {
  const BlogCenterDesk({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: <Widget>[
          Expanded(child: BlogCardDesk()),
        ],
      ),
    );
  }
}

class BlogCenterMob extends StatelessWidget {
  const BlogCenterMob({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[BlogCardMob()],
      ),
    );
  }
}

class BlogCenterTab extends StatelessWidget {
  const BlogCenterTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlogCardTab(),
        ],
      ),
    );
  }
}
