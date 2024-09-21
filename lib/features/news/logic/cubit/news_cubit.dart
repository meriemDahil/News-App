import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newsapp/features/news/data/news_response.dart';
import 'package:newsapp/features/news/repo/news_repo.dart';

part 'news_state.dart';
part 'news_cubit.freezed.dart';

class NewsCubit extends Cubit<NewsState> {

  NewsRepository _newsRepo;
  NewsCubit(this._newsRepo) : super(NewsState.initial());
 Future<void> fechNews(String query) async {
    emit(NewsState.loading());
    try{
    final articles = await  _newsRepo.fetchArticles(query);
    emit(NewsState.success(articles));
    }catch(e){
    emit(NewsState.error('Failed to fetch articles: $e'));
    }
  }
} 