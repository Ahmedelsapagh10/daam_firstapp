import 'package:first_project/features/home_screen/data/web_services/home_web_services.dart';

import '../model/main_news_model.dart';

class HomeRep {
  final HomeWebServices api;
  HomeRep(this.api);

  Future<MainNewsModel> getNews() async {
    final response = await api.getNews();

    return MainNewsModel.fromJson(response);
  }
}
