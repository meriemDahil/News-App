import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/features/news/logic/cubit/news_cubit.dart';
import 'package:newsapp/features/news/repo/news_repo.dart';
import 'package:newsapp/features/splashscreen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(NewsRepository()),  // Provide the NewsCubit
      child: MaterialApp(
        home:SplashScreen(),
      ),
    );
  }
}
