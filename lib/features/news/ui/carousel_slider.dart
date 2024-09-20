import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/features/news/data/news_response.dart';


class CarouselSlide extends StatelessWidget {
   final List<Article> articles;
   CarouselSlide({super.key, required this.articles,});

  @override
 
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
     // height: 400.0,
      aspectRatio: 16/9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,//The carousel will loop infinitely
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 4),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      ),
      items: 
      articles
      .map((i) {
      return Builder(
      builder: (BuildContext context) {
      return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
      color: Colors.lime,
      borderRadius: BorderRadius.circular(20)
      ),
      child: Center(child: Text(i.author?? 'author undefiend')),
      );
      },
      );
      }).toList(),
      );
}
}