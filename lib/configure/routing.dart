import 'package:DeveloperFolio/configure/centeredview.dart';
import 'package:DeveloperFolio/include/CenteringOfPages/ContactCenter.dart';
import 'package:DeveloperFolio/include/CenteringOfPages/Education.dart';
import 'package:DeveloperFolio/include/Rows/contactpagemain.dart';
import 'package:DeveloperFolio/pages/achievementspage.dart';
import 'package:DeveloperFolio/pages/blogpage.dart';
import 'package:DeveloperFolio/pages/contactpage.dart';
import 'package:DeveloperFolio/pages/homepage.dart';
import 'package:DeveloperFolio/pages/progresspage.dart';
import 'package:DeveloperFolio/pages/skillspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';
  
const String SkillsRoute = 'skills';
const String ProjectsRoute = 'projects';
const String EducationRoute = 'education';
const String AchievementsRoute = 'achievements';
const String ContactRoute = 'contact';
const String BlogRoute = 'blogs';
const String HomeRoute = 'Home';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomePage(), settings.name ?? HomeRoute);
    case SkillsRoute:
      return _getPageRoute(ScreenTypeLayout(
        desktop: CenteredViewDesk(child: SkillsPage()),
        tablet: CenteredViewTab(child: SkillsPage()),
        mobile: CenteredViewMob(child: SkillsPage()),
      ), settings.name ?? SkillsRoute);
    case ProjectsRoute:
      return _getPageRoute(
        ScreenTypeLayout(
      desktop: CenteredViewDesk(child: BlogPage(),),
      tablet: CenteredViewTab(child: BlogPage(),),
      mobile: CenteredViewMob(child: BlogPage(),),
      ), settings.name ?? ProjectsRoute);
    case EducationRoute:
      return _getPageRoute(
        ScreenTypeLayout(
      desktop: CenteredViewDesk(child: EducationDesk(),),
      tablet: CenteredViewTab(child: EducationTab(),),
      mobile: CenteredViewMob(child: EducationMob(),),
      ), settings.name ?? EducationRoute);
    case AchievementsRoute:
      return _getPageRoute(
        ScreenTypeLayout(
          desktop: CenteredViewDesk(child: AchievementsPage()),
          tablet: CenteredViewTab(child: AchievementsPage()),
          mobile: CenteredViewMob(child: AchievementsPage()),
        ), settings.name ?? AchievementsRoute);
    case ContactRoute:
      return _getPageRoute(
        ScreenTypeLayout(
          desktop: CenteredViewDesk(child: ContactPageDesk()),
          tablet: CenteredViewTab(child: ContactPage()),
          mobile: CenteredViewMob(child: ContactPage()),
        ), settings.name ?? ContactRoute);
    case BlogRoute:
      return _getPageRoute(ScreenTypeLayout(
      desktop: CenteredViewDesk(child: BlogPage(),),
      tablet: CenteredViewTab(child: BlogPage(),),
      mobile: CenteredViewMob(child: BlogPage(),),
      ), settings.name ?? BlogRoute);
    default: return _getPageRoute(HomePage(), settings.name ?? HomeRoute);
  }
}

PageRoute _getPageRoute(Widget child, String routeName) {
  return _FadeRoute(child: child, routeName: routeName);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({required this.child, required this.routeName})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                child,
            settings: RouteSettings(name: routeName),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                FadeTransition(
                  opacity: animation,
                  child: child,
                ));
}
