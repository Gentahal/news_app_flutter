import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/article.dart';
import 'package:news_app_flutter/screen/detailpage.dart';
import 'package:news_app_flutter/utils/utils.dart';

class CarouselWidget extends StatefulWidget {
  final List<Article> articleList;

  CarouselWidget(this.articleList);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {


  late List<Widget> imageSlider;

  @override
  void initState() {
    //karna articleList berada diluar state ketika kita ingin mengaksesnya kita harus menggunakan widget
    imageSlider = widget.articleList
        .map((article) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(article: article)));
        },
        child: Container(
          margin: EdgeInsets.all(10),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(article.urlToImage))),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient( //ngasih gradient buat image
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [
                          0.1,
                          0.9
                        ],
                        colors: [
                          Colors.black.withOpacity(0.8), //oapcity
                          Colors.white.withOpacity(0.1),
                        ])),
              ),
             Positioned(
               bottom: 30,
               child: Container(
                 padding: EdgeInsets.only(left: 10,right: 10),
                 width: 250,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       article.title,
                       style: titleArticleHeadline.copyWith(fontSize: 12),
                     ),
                     SizedBox(
                       height: 10,
                     ),
                     Text(article.author, style: authorDateArticleHeadline.copyWith(fontSize: 12),
                     )
                   ],
                 ),
               ),
             )
            ],
          ),
        ),
      );})
        .toList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
          items: imageSlider,
          options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1
            // enlargeCenterPage: true,
          )),
    );
  }
}