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

// class NewsCubit extends Cubit<NewsState> {
//   final NewsRepository _newsRepo;
//   int _currentPage = 1;
//   bool _hasReachedEnd = false;
//   List<Article> _articles = [];

//   NewsCubit(this._newsRepo) : super(NewsState.initial());

//   Future<void> fetchNews(String query, {bool isRefresh = false}) async {
//     if (isRefresh) {
//       _currentPage = 1; // Reset the page count if refreshing
//       _articles.clear();
//       _hasReachedEnd = false;
//     }

//     if (_hasReachedEnd) return; 

//     emit(NewsState.loading());

//     try {
//       final articles = await _newsRepo.fetchArticles(query, );
      
//       if (articles.isEmpty) {
//         _hasReachedEnd = true; 
//       } else {
//         _articles.addAll(articles);
//         print(articles);
//         print(_currentPage);
//         _currentPage++; // Increment the page for the next fetch
//       }

//       emit(NewsState.success(_articles));
//     } catch (e) {
//       emit(NewsState.error('Failed to fetch articles: $e'));
//     }
//   }

//   void loadMoreNews(String query) {
//     if (!_hasReachedEnd) {
//       fetchNews(query);
//     }
//   }
// }
