import '../Rows/contactpagemain.dart';
import 'package:flutter/material.dart';

class ContactCenterDesk extends StatelessWidget {
  const ContactCenterDesk({super.key});
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Row(
        children: <Widget>[
          ContactPageDesk(),
        ],
      ),
    );
  }
}

class ContactCenterMob extends StatelessWidget {
  const ContactCenterMob({super.key});
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[ContactPageMob()],
      ),
    );
  }
}

class ContactCenterTab extends StatelessWidget {
  const ContactCenterTab({super.key});
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[ContactPageTab()],
      ),
    );
  }
}
