import 'package:flutter/material.dart';
import 'package:newsapp/core/search.dart';
import 'package:newsapp/core/text.dart';
import 'package:newsapp/features/news/data/news_response.dart';
import 'package:newsapp/features/news/repo/news_repo.dart';
import 'package:newsapp/features/news/ui/carousel_slider.dart';
import 'package:newsapp/features/news/ui/tabbar.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
   NewsRepository repo = NewsRepository();
    late Future<List<Article>> articlesFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    articlesFuture =repo.fetchArticles('Algeria');
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children:  [
              const Row(
                children: [
                  Image(image: AssetImage('assets/news.png'),height: 50,),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      children: [
                       SizedBox(height: 20,),
                       SearchWidget(),
                      ],
                    ),
                  ),
                   SizedBox(width: 10,),
                ],
              ),
              const SizedBox(height: 20,),
              BigText(text:'Trending'),
               FutureBuilder<List<Article>>(
                future: articlesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No articles found'));
                  }
               final articles = snapshot.data!;
               return CarouselSlide(articles:articles);
                }
                ),
                Tabbar(),
            ],
          ),
        ),
      ),
    );
  }
}