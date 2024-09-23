import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/search.dart';
import 'package:newsapp/core/text.dart';
import 'package:newsapp/features/news/data/news_response.dart';
import 'package:newsapp/features/news/logic/cubit/news_cubit.dart';
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
              BlocBuilder<NewsCubit, NewsState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is Error) {
                    return Center(child: Text(state.error));
                  }else if (state is Success) {
                    final articles = state.articles;
                    if (articles.isEmpty) {
                      return const Center(child: Text('No articles found'));
                    } else {
                      return CarouselSlide(articles: articles);
                    }
                  }
                  return const SizedBox.shrink(); 
                },
              ),
              const Tabbar(),
            ],
          ),
        ),
      ),
    );
  }
}