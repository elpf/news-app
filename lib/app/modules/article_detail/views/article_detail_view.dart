
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/article.dart';
import '../controllers/article_detail_controller.dart';
import 'article_detail_web_view.dart';

class ArticleDetailPage extends GetView<ArticleDetailController> {
  final Article article;
  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail Page'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: article.urlToImage ?? article.title,
              child: article.urlToImage != null
                  ? Image.network(
                      article.urlToImage!,
                      fit: BoxFit.cover,
                      height: 250,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey,
                          child: const Center(
                            child: Text(
                              'No Image',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      },
                    )
                  : Container(
                      color: Colors.grey,
                      height: 250,
                      child: const Center(
                        child: Text(
                          'No Image',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.description ?? "-",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.grey, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        'Published: ${article.publishedAt.toLocal().toString().split(' ')[0]}',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.person, color: Colors.grey, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        'Author: ${article.author}',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 8),
                  Text(
                    article.content ?? "-",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Read more',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Get.to(() => ArticleDetailWebView(article: article));
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
