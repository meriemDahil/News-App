
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

    // Check if response has 200 status and data is in expected JSON format
    if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
      final newsResponse = NewsResponse.fromJson(response.data);

      // Ensure articles are not null and have data
      if (newsResponse.articles != null && newsResponse.articles.isNotEmpty) {
        return newsResponse.articles;
      } else {
        // Return an empty list if no articles found
        print('No articles found');
        return [];
      }
    } else {
      print('Error: Unexpected response status ${response.statusCode}');
      throw Exception('Failed to fetch articles');
    }
  } on DioError catch (dioError) {
    if (dioError.response != null) {
      // If DioError contains a response, log the status code and response
      print('Dio error response status: ${dioError.response?.statusCode}');
      print('Dio error response data: ${dioError.response?.data}');
      throw Exception('Error fetching articles: ${dioError.response?.statusCode}');
    } else if (dioError.type == DioExceptionType.connectionError) {
      // Handle connection errors (network issues)
      print('Connection error: ${dioError.message}');
      throw Exception('Connection error');
    } else {
      // Log and throw any other unexpected Dio errors
      print('DioError: $dioError');
      throw Exception('Error fetching articles');
    }
  } catch (e) {
    // General catch block for any unexpected errors
    print('Unexpected error: $e');
    throw Exception('Unexpected error occurred');
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