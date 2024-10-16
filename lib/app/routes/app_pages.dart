import 'package:get/get.dart';
import 'package:mobile_codelab_md2/app/modules/article_detail/bindings/article_detail_bindings.dart';
import 'package:mobile_codelab_md2/app/modules/article_detail/views/article_detail_view.dart';
import 'package:mobile_codelab_md2/app/modules/article_detail/views/article_detail_web_view.dart';
import 'package:mobile_codelab_md2/app/modules/get_connect/bindings/get_connect_binding.dart';
import 'package:mobile_codelab_md2/app/modules/get_connect/views/get_connect_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.GETCONNECT,
        page: () => const GetConnectView(),
        binding: GetConnectBinding()),
    GetPage(
        name: _Paths.ARTICLE_DETAILS,
        page: () => ArticleDetailPage(article: Get.arguments),
        binding: ArticleDetailBinding()),
    GetPage(
        name: _Paths.ARTICLE_DETAILS_WEBVIEW,
        page: () => ArticleDetailWebView(article: Get.arguments),
        binding: ArticleDetailBinding())
  ];
}
