
import 'package:dio/dio.dart';
import 'package:newsapp/features/news/data/news_response.dart';

class NewsRepository{

  final Dio dio = Dio();


   Future<List<Article>> fetchArticles(String query) async {
    try {
      final response = await dio.get(
        '$baseUrl/everything',
        queryParameters: {
          'q': query,
          'searchIn': 'title',
          'apiKey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final newsResponse = NewsResponse.fromJson(response.data);
        print(newsResponse.articles.length);
        print(newsResponse.articles[2].author);
        return newsResponse.articles;
      } else {
        throw Exception('Failed to fetch articles');
      }
    } catch (e) {
      throw Exception('Error fetching articles: $e');
    }
  }
  Future<bool> isImageUrlAvailable(String url) async {
    try {
      var response = await Dio().head(url);
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}

/*
change the author with the image url
cashes the daily images
add categories and silver list 
add seach func
add the details screen
try to check connection
 */