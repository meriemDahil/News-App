import 'package:flutter/material.dart';
import 'package:newsapp/core/rounded_button.dart';
import 'package:newsapp/core/text.dart';
import 'package:newsapp/features/news/ui/news_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             const SizedBox(height: 100,),
             const Center(
              child: Image(
                image: AssetImage('assets/old_newspaper.png'),
                height: 300,
                width: 350,
                ),
                ),
           
                 BigText(
                  text: 'Discover \nNews & articals',),
                  BigText(
                  text: 'News & articals',),
                const SizedBox(height: 10,),
                SmallText(text: 'Get the latest updates on the most popular and hot news with us'),
                const SizedBox(height: 30,),
                RoundedButton(
                  label: 'Start',
                  onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('seenWelcomeScreen', true);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => NewsListScreen()));
              },
                  
                )
        
        ],),
      ),

    );
  }
}