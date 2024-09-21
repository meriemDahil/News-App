import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/core/text.dart';
import 'package:newsapp/features/news/data/news_response.dart';
import 'package:newsapp/features/news/repo/news_repo.dart';


class CarouselSlide extends StatelessWidget {
   final List<Article> articles;
   CarouselSlide({super.key, required this.articles,});

  @override
 
  Widget build(BuildContext context) {
    NewsRepository repo= NewsRepository();
    return  CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlayInterval: Duration(seconds: 3),
            ),
            items: articles.map((article) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 242, 241, 235),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: 
                        FutureBuilder<bool>(
                          future: repo.isImageUrlAvailable(article.urlToImage ?? ''),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return CircularProgressIndicator(); 
                            } else if (snapshot.hasError || !snapshot.data!) {
                              return Image.asset('assets/news.png', ); 
                            }
                            return Stack(
                              children:[
                                 Positioned.fill(
                                   child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                    image: 
                                    NetworkImage(article.urlToImage!),
                                    fit: BoxFit.cover,
                                    onError:(exception, stackTrace) => Image.asset('assets/news.png',),
                                    )),
                                    
                                   ),
                                 ),
                                 Positioned( 
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(article.title,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Color.fromARGB(255, 0, 0, 0),overflow: TextOverflow.ellipsis),),
                                  ))
                              ]
                              );
                          },
                        ),
                  );
                },
              );
            }).toList(),
          );
}
}