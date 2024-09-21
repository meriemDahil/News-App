import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/core/text.dart';
import 'package:newsapp/features/news/data/news_response.dart';
import 'package:newsapp/features/news/logic/cubit/news_cubit.dart';
import 'package:newsapp/features/news/repo/news_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class TabView extends StatefulWidget {
  final String query;
  const TabView({super.key, required this.query});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  
  late NewsCubit _newsCubit;

  @override
  void initState() {
    super.initState();
    _newsCubit = BlocProvider.of<NewsCubit>(context);  // Fetch the cubit from the context
    _newsCubit.fechNews(widget.query);  // Trigger the API call
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Error) {
          return Center(child: Text('Error: ${state.error}'));
        } else if (state is Success) {
          final articles = state.articles;
          if (articles.isEmpty) {
            return const Center(child: Text('No articles found'));
          }
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return ListTile(
                leading: SizedBox(
                  width: 100,
                  height: 100,
                  child:Image(image:NetworkImage(
                     article.urlToImage ?? ''),
                    //placeholder: (context, url) => Image.asset('assets/news.png', fit: BoxFit.cover),
                    errorBuilder: (context, url, error) => Image.asset('assets/news.png', fit: BoxFit.cover),
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  article.title,
                  style: const TextStyle(
                    overflow: TextOverflow.clip,
                  ),
                  maxLines: 3,
                ),
              );
            },
          );
        } else {
          return const Center(child: Text('Unexpected State'));
        }
      },
    );
  }
}
