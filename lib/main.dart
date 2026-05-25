import 'dart:async';
import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'config/constants.dart';
import 'sections/nav_bar.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';
import 'sections/experience_section.dart';
import 'sections/certifications_section.dart';
import 'sections/writing_section.dart';
import 'sections/contact_section.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Francisco Javier Quiles Ruiz — DevSecOps',
      theme: AppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainScroll()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('> initializing', style: AppTheme.sectionComment),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(seconds: 2),
                builder: (_, v, __) => ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: v,
                    backgroundColor: surfaceColor,
                    color: accentColor,
                    minHeight: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainScroll extends StatelessWidget {
  const MainScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 64),
                HeroSection(),
                AboutSection(),
                ProjectsSection(),
                SkillsSection(),
                ExperienceSection(),
                WritingSection(),
                CertificationsSection(),
                ContactSection(),
                FooterSection(),
              ],
            ),
          ),
          Positioned(top: 0, left: 0, right: 0, child: NavBar()),
        ],
      ),
    );
  }
}
