import '../../pages/footer.dart';
import '../../pages/progresspage.dart';
import '../../pages/welcome.dart';
import '../CenteringOfPages/Achievement.dart';
import '../CenteringOfPages/Blogcenter.dart';
import '../CenteringOfPages/ContactCenter.dart';
import '../CenteringOfPages/Education.dart';
import '../CenteringOfPages/skills_desk.dart';
import '../Rows/contactpagemain.dart';
import '../Rows/educationmain.dart';
import '../imagesmain/images.dart';
import '../Rows/progressbarmain.dart';
import '../Rows/skillslogosmain.dart';
import '../Rows/welcomepagemain.dart';
import 'package:flutter/material.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  _HomeDesktopState createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  var _controller = ScrollController();

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
    return SafeArea(
      child: Scrollbar(
        controller: _controller,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                          child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  children: [
                     
                    Row(
                      children: <Widget>[
                        Expanded(child: WelcomePage()),
                        Expanded(child: OneDesk()),
                      ],
                    ),
                    SizedBox(
                      height: 75,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(child: TwoDesk()),
                        Expanded(child: SkillsLogoDesk()),
                      ],
                    ),
                    SizedBox(
                      height: 75,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(child: SkillBarDesk()),
                        Expanded(child: ThreeDesk()),
                      ],
                    ),
                    SizedBox(
                      height: 75,
                    ),
                    Row(
                      children: [
                        Expanded(child: EducationDesk()),
                      ],
                    ),
                    SizedBox(
                      height: 75,
                    ),
                    Row(
                      children: [
                        Expanded(child: AchievementDesk()),
                      ],
                    ),
                     SizedBox(
                      height: 75,
                    ),
                    Row(
                      children: [
                        Expanded(child: BlogCenterDesk()),
                      ],
                    ),
                     SizedBox(
                      height: 75,
                    ),
                     Row(
                      children: [
                        Expanded(child: ContactCenterDesk()),
                        Expanded(child: FourDesk(),),
                      ],
                    ),
                    SizedBox(height: 100,),
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
        ),
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {
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
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                WelcomePageMob(),
                OneMob(),
                SkillsMob(),
                ProgressPage(),
                EducationMob(),
                AchievementMob(),
                BlogCenterMob(),
                ContactCenterMob(),
                SizedBox(height: 50,),
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
                    physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                WelcomePageTab(),
                OneTab(),
                SkillsTab(),
                ProgressPage(),
                EducationTab(),
                AchievementTab(),
                BlogCenterTab(),
                ContactCenterTab(),
                SizedBox(height: 50,),
                FooterMob(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
