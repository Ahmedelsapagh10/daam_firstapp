import 'package:first_project/features/home_screen/data/model/main_news_model.dart';
import 'package:first_project/features/home_screen/data/repository/home_rep.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(InitalHomeState());

  int counter = 0;

  void increament() {
    counter++;
    emit(IncreamentHomeState());
  }

  void decreament() {
    counter--;
    emit(DecreamentHomeState());
  }

  // void loadScreen() {
  //   emit(LoadingScreen());
  //   Future.delayed(Duration(seconds: 5), () {
  //     emit(SuccessScreen());
  //   });
  // }

  final HomeRep repo;

  MainNewsModel? allData;
  Future<void> getNews() async {
    emit(LoadingScreen());
    try {
      allData = await repo.getNews();
      emit(SuccessScreen());
    } catch (e) {
      emit(ErrorScreen());
    }
  }
}
