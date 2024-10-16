import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_codelab_md2/app/data/services/get_connect_controller.dart';
import 'package:mobile_codelab_md2/app/modules/components/card_article.dart';
import 'package:mobile_codelab_md2/app/routes/app_pages.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GetConnectController controller = Get.put(GetConnectController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('News of the day'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.secondary),
            ),
          );
        } else if (controller.articles.isEmpty) {
          return const Center(
            child: Text('No articles found'),
          );
        } else {
          var breakingNewsArticle = controller.articles.first;
          var latestNewsArticle = controller.articles.length > 1
              ? controller.articles[1]
              : null;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Breaking News',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.GETCONNECT);
                        },
                        child: Text(
                          'More',
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: CardArticle(article: breakingNewsArticle),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: Text(
                    'Latest News',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (latestNewsArticle != null)
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    child: CardArticle(article: latestNewsArticle),
                  ),
              ],
            ),
          );
        }
      }),
    );
  }
}
