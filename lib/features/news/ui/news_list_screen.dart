import 'package:flutter/material.dart';
import 'package:newsapp/features/news/ui/search.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SearchWidget(),
          ],
        ),
      ),
    );
  }
}