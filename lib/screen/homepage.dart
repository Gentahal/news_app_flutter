import 'package:flutter/material.dart';
import 'package:news_app_flutter/model/article.dart';
import 'package:news_app_flutter/screen/newspage.dart';
import 'package:news_app_flutter/service/data_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    News news = News();
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: NetworkImage(
                  'https://dicoding-web-img.sgp1.cdn.digitaloceanspaces.com/small/avatar/dos:41ab868251f39aceef211ffdc2a32a3420211207073002.png'),
            ),
          ),
          width: 10,
          margin: EdgeInsets.all(5),
        ),
        title: Text(
          'Good Morning',
          style: TextStyle(
            fontSize: 20, color: Colors.black
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.bookmark),
            color: Colors.blue,
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: news.getNews(),
        builder: (context, snapshoot) => snapshoot.data != null
        ? NewsPage(snapshoot.data as List<Article>)
        : Center(
          child: CircularProgressIndicator(),
        )
      ),
    );
  }
}
