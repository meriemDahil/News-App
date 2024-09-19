import 'package:flutter/material.dart';
import 'package:newsapp/features/news/ui/news_list_screen.dart';
import 'package:newsapp/features/welcome_page/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    super.initState();
    checkOnboarding();
  }
  Future<void> checkOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seenWelcomeScreen = prefs.getBool('seenWelcomeScreen') ?? false;

    if (seenWelcomeScreen) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => NewsListScreen()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LandingPage()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(child: CircularProgressIndicator()), 
    );
  }
}