import 'package:flutter/material.dart';
import 'package:newsapp/models/news_model/news_model.dart';

class HomeDetailedNews extends StatelessWidget {
  final Article article;

  HomeDetailedNews(this.article);

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(article.title.toString()),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(article.urlToImage.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                
                    const SizedBox(height: 10),
                
                    // Article Details
                    Text(
                      article.title.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                
                    const SizedBox(height: 10),
                
                    // Author and Publisher
                    Text(
                      "By ${article.author} | ${article.source.name}",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                
                    const SizedBox(height: 10),
                
                    // Description
                    Text(
                      article.description.toString(),
                      style: const TextStyle(fontSize: 17),
                    ),
                
                    const SizedBox(height: 10),
                
                    // Content
                    Text(
                      article.content,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            ),
          );



  }


}
