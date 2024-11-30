import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/models/news_model/news_model.dart';

class NewsTile extends StatelessWidget {

  Article article;

  NewsTile(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Image
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(article.urlToImage.toString()),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 10),

            // Article Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    article.title.toString(),

                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 4),

                  // Author and Publisher
                  Text(
                    "By ${article.author} | ${article.source.name}",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),

                  const SizedBox(height: 8),

                  // Description
                  Text(
                    article.description.toString(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );


  }
}