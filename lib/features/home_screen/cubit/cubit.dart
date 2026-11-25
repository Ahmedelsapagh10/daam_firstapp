import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitalHomeState());

  int counter = 0;

  void increament() {
    counter++;
    emit(IncreamentHomeState());
  }

  void decreament() {
    counter--;
    emit(DecreamentHomeState());
  }

  void loadScreen() {
    emit(LoadingScreen());
    Future.delayed(Duration(seconds: 5), () {
      emit(SuccessScreen());
    });
  }
}
