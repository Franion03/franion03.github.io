import '../../pages/footer.dart';
import '../../pages/welcome.dart';
import '../../view/certifications/certifications.dart';
import '../../view/history/history.dart';
import '../../view/projects/project_view.dart';
import '../CenteringOfPages/ContactCenter.dart';
import '../imagesmain/images.dart';
import '../Rows/skillslogosmain.dart';
import '../Rows/welcomepagemain.dart';
import 'package:flutter/material.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({super.key});

  @override
  _HomeDesktopState createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Row(
                  children: <Widget>[
                    Expanded(child: WelcomePage()),
                    Expanded(child: OneDesk()),
                  ],
                ),
                const SizedBox(
                  height: 75,
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: TwoDesk()),
                    Expanded(child: SkillsLogoDesk()),
                  ],
                ),
                const SizedBox(
                  height: 75,
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: History()),
                    Expanded(child: ThreeDesk()),
                  ],
                ),
                const SizedBox(
                  height: 75,
                ),
                Row(
                  children: [
                    Expanded(child: ProjectsView()),
                  ],
                ),
                const SizedBox(
                  height: 75,
                ),
                Row(
                  children: [
                    Expanded(child: Certifications()),
                  ],
                ),
                const SizedBox(
                  height: 75,
                ),
                Row(
                  children: [
                    const Expanded(child: ContactCenterDesk()),
                    Expanded(
                      child: FourDesk(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    Expanded(child: FooterPage()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                const WelcomePageMob(),
                OneMob(),
                History(),
                ProjectsView(),
                Certifications(),
                const ContactCenterMob(),
                const SizedBox(
                  height: 50,
                ),
                FooterPage()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                const WelcomePageTab(),
                OneMob(),
                History(),
                ProjectsView(),
                Certifications(),
                const ContactCenterTab(),
                const SizedBox(
                  height: 50,
                ),
                FooterMob(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
