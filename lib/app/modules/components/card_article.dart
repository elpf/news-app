import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_codelab_md2/app/modules/article_detail/controllers/article_detail_controller.dart';
import 'package:mobile_codelab_md2/app/modules/article_detail/views/article_detail_view.dart';
import '../../data/models/article.dart';

class CardArticle extends StatelessWidget {
  final Article article;
  const CardArticle({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isWideScreen = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            if (isWideScreen) {
              Get.put(ArticleDetailController());

              showDialog(
                context: context,
                builder: (_) => Dialog(
                  child: ArticleDetailPage(article: article),
                ),
              );
            } else {
              Get.put(ArticleDetailController());
              Get.to(() => ArticleDetailPage(article: article));
            }
          },
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Hero(
                  tag: article.id.toString(),
                  child: SizedBox(
                    width: double.infinity,
                    height: 180,
                    child: article.urlToImage.isNotEmpty
                        ? Image.network(
                            article.urlToImage,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey,
                                child: const Center(
                                  child: Text('Image Error'),
                                ),
                              );
                            },
                          )
                        : Container(
                            color: Colors.grey,
                            child: const Center(
                              child: Text(
                                'No Image',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_today,
                            color: Colors.grey, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          'Published: ${article.publishedAt.toLocal().toString().split(' ')[0]}',
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.person, color: Colors.grey, size: 16),
                        const SizedBox(width: 4),
                        Text(article.author,
                            style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 127, 127, 127))),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      article.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
